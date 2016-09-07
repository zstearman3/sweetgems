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
end
