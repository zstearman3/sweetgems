class UsersController < ApplicationController
  before_action :logged_in_admin, only: [:index, :edit, :update]
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you for signing up! "
      redirect_to menu_path
    else
      error_script = ""
      @user.errors.full_messages.each do |msg|
        error_script += msg
      end
      if !error_script.nil? 
        flash[:danger] = "Uh, oh!" + " " + error_script + "!"
      else
        flash[:danger] = "Uh, oh! Something went wrong!"
      end
      redirect_to menu_path
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
    def logged_in_admin
      unless logged_in?
        redirect_to root_url
      end
    end
end
