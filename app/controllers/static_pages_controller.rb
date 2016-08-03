class StaticPagesController < ApplicationController
  def home
    @user = User.new
  end

  def help
  end

  def contact
  end

  def about
  end
  
  def menu
  end
  
  def blog
  end
end
