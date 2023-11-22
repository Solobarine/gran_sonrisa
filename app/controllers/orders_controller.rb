require 'httparty'
class OrdersController < ApplicationController
  def index; end

  def initialize_transaction
    uuid = UUID.new
    car = Car.find(params[:id])
    puts car.price

    url = 'https://api.paystack.co/transaction/initialize'

    body = {
      reference: "SONRISA-#{uuid.generate}",
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
      redirect_to response['data']['authorization_url'], allow_other_host: true
    else
      redirect_back
    end
  end

  def create; end

  def update; end

  def verify(transaction_reference)
    paystack = Paystack.new
    PaystackTransactions.verify(paystack, transaction_reference)
  end

  def cancel; end
end
