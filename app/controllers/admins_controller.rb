class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :edit, :update, :show, :create]
  
  def index
    @admins = Admin.all
    @user ||= User.new
  end
  
  def show
    @admin = Admin.find(params[:id])
    @user ||= User.new
  end
  
  private
end
