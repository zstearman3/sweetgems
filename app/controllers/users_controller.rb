class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you for signing up! "
      redirect_to menu_path
    else
      flash[:danger] = "Uh, oh! Something went wrong!"
      redirect_to menu_path
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
