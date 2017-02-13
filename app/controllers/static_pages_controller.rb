class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end

  def help
  end

  def contact
    @user ||= User.new
  end

  def about
    @user ||= User.new
  end
  
  def menu
    @user ||= User.new
  end
  
  def blog
    @user ||= User.new
  end
end
