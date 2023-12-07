class OrderMailer < ApplicationMailer
  default from: 'gransonrisa@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.success.subject
  #
  def success
    @greeting = 'Hi'
    @order = params[:order]

    mail(to: @order.user.email, subject: 'Successful Car Purchase')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.failed.subject
  #
  def failed
    @greeting = 'Hi'

    mail to: 'to@example.org'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.cancel.subject
  #
  def cancel
    @greeting = 'Hi'

    mail to: 'to@example.org'
  end
end
