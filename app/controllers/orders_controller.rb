class OrdersController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update, :destroy, :index]
  
  def show
    @order = Order.find(params[:id])
    @user ||= User.new
  end
  
  def new
    @order = Order.new
    @user ||= User.new
  end
  
  def create
    @order = Order.new(order_params)
    @user ||= User.new
    if @order.save
      OrderMailer.new_order(@order).deliver_now
      redirect_to "/order-confirmation"
    else
      render 'new'
    end
  end
  
  def index
    @orders = Order.all.order('created_at ASC')
    @user ||= User.new
  end
  
  def edit
    @order = Order.find(params[:id])
    @user ||= User.new
  end
  
  def update
    @order = Order.find(params[:id])
    @user ||= User.new
    if @order.update_attributes(order_params)
      flash[:success] = "Order Updated!"
      redirect_to '/orders'
    else
      render 'edit'
    end
  end
  
  def confirmation
    @user ||= User.new
  end
  
  def destroy
    @user ||= User.new
    Order.find(params[:id]).destroy
    flash[:success] = "Order deleted"
    redirect_to '/orders'
  end
  
  private
  
    def order_params
      params.require(:order).permit(:name, :email, :phone, :details, :is_completed)
    end
end
