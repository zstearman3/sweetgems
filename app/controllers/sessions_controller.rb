class SessionsController < ApplicationController
  def new
  end
  
  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      flash[:success] = 'Welcome, ' + current_admin.name + "!"
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
  end
end
