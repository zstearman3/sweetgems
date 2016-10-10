class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order.subject
  #
  
  def new_order(order)
    @order = order
    @greeting = "Hi, Meg!"
    mail to: "meg@sweetgemshtx.com", subject: "New Order!"
  end
end
