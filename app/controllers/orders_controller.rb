require 'httparty'
require 'prawn'

# Controller for Orders
class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find_by(id: params[:id])

    if @order

      return if @order.user.eql?(current_user)

      redirect_to orders_path, notice: 'Unauthorized'
    else
      redirect_to orders_path, notice: 'Order Does not Exist'
    end
  end

  def initialize_transaction
    uuid = UUID.new
    car = Car.find(params[:id])
    reference = "SONRISA-#{uuid.generate}"

    url = 'https://api.paystack.co/transaction/initialize'

    body = {
      reference:,
      email: current_user.email,
      amount: car.price,
      callback_url: "https://gran-sonrisa.onrender.com/callback/#{reference}"
    }.to_json

    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{ENV['PAYSTACK_SECRET_KEY']}"
    }

    response = HTTParty.post(
      url,
      body:,
      headers:
    )

    puts response
    if response['status']

      # Create New Order
      @order = Order.new
      @order.car = car
      @order.reference = reference
      @order.user = current_user
      @order.currency = 'NGN'
      @order.payment_method = 'not_selected'
      @order.price = car.price
      @order.save
      redirect_to response['data']['authorization_url'], allow_other_host: true
    else
      redirect_to car_path(car), notice: 'Unable to Initialize Transaction.'
    end
  end

  def update; end

  def cancel; end

  def webhook
    puts 'here'
    event = request.body.event

    # Verify Request
    return unless verify(request.body)

    # Check Event Type
    if event.eql?('charge.success')
      # Create Order
      create(request.body)
    else
      Order.where(reference: request.body.data.reference).first&.delete
      render 'failed'
    end
  end

  def callback
    # Check If Order Exist
    @order = Order.find_by(reference: params[:reference])

    if @order
      @message = 'Your Transaction is being Processed'
    else
      redirect_to cars_path, notice: 'You do not have an Order'
    end
  end

  def success; end

  def fail; end

  private

  # Verify Request Coming From Paystack
  def verify(request_body)
    reference = request_body.data.reference

    url = "https://api.paystack.co/transaction/verify/#{reference}"

    secret_key = ENV['PAYSTACK_PRIVATE_KEY']

    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{secret_key}"
    }

    response = HTTParty.get(url, headers)

    response['status'] === response['data']['status']
  end

  def create(request_body)
    # Get Reference and Payment Method
    reference = request_body.data.reference
    payment_method = request_body.data.channel

    # Update Order to Complete
    order = Order.where(reference:)
    order.status = 'success'
    order.payment_method = payment_method
    order.save

    # Mark Car as Sold
    mark_car_as_sold(order.car)

    # Send Email
    OrderMailer.with(order:).success.deliver_later

    # Render Success
    render 'success'
  end

  # Mark Car as Sold
  def mark_car_as_sold(car)
    car.sold = true
    car.save
  end

  # Create PDF
  def create_pdf; end

  def order_params
    params.require(:user, :car)
  end
end
