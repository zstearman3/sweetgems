class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :edit, :update, :show, :create]
  
  def index
    @admins = Admin.all
  end
  
  def show
    @admin = Admin.find(params[:id])
  end
  
  private
end
