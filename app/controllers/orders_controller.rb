class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to "/order-confirmation"
    else
      render 'new'
    end
  end
  
  private
  
    def order_params
      params.require(:order).permit(:name, :email, :phone, :details)
    end
end
