require 'httparty'
require 'prawn'
require 'openssl'

# Controller for Orders
class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    return if @order.user.eql?(current_user)

    redirect_to orders_path, notice: 'Unauthorized'
  end

  def initialize_transaction
    uuid = UUID.new
    car = Car.find(params[:id])
    reference = "SONRISA-#{uuid.generate}"
    puts car.price

    url = 'https://api.paystack.co/transaction/initialize'

    body = {
      reference:,
      email: current_user.email,
      amount: car.price
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
      redirect_back
    end
  end

  def update; end

  def cancel; end

  def webhook
    puts 'here'
    event = request.body.event
    paystack_signature = request.headers['X-Paystack-Signature']

    # Verify Request
    return unless verify(request.body, paystack_signature)

    # Check Event Type
    nil unless event.eql?('charge.success')

    # Create Order
    # create(request.body)
  end

  private

  # Verify Request Coming From Paystack
  def verify(request_body, paystack_signature)
    secret_key = ENV['PAYSTACK_PRIVATE_KEY']
    puts secret_key
    digest = OpenSSL::Digest.new('sha512')
    signature = OpenSSL::HMAC.hexdigest(digest, secret_key, request_body)

    # Verify if Signtures Matches
    signature.eql?(paystack_signature)
  end

  def create(request_body)
    reference = request_body.data.reference
    payment_method = request_body.data.channel
    # Update Order to Complete
    order = Order.where(reference:)
    order.status = 'success'
    order.payment_method = payment_method
    order.save

    # Create PDF Invoice
    # Mark Car as Sold
    mark_car_as_sold(order.car)
    # Send Email
    OrderMailer.with(order:).success.deliver_later
    # Redirect to Purchases
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
