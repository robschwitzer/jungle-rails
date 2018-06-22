class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order, items)
    @order = order
    @items = items
    @url   = "http://jungle.com"
    mail(to: @order.email, subject: "Thank you for your order")
  end

end
