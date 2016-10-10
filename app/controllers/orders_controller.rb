class OrdersController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :destroy, :index]
  
  def show
    @order = Order.find(params[:id])
  end
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      OrderMailer.new_order(@order).deliver_now
      redirect_to "/order-confirmation"
    else
      render 'new'
    end
  end
  
  def index
    @orders = Order.all
  end
  
  private
  
    def order_params
      params.require(:order).permit(:name, :email, :phone, :details)
    end
end
