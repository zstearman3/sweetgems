class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:index, :edit, :update]
  
  def index
    @admins = Admin.all
  end
  
  def show
    @admin = Admin.find(params[:id])
  end
  
  private
end
