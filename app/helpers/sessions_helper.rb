module SessionsHelper
  
  #Logs in the given admin.
  def log_in(admin)
    session[:admin_id] = admin.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
