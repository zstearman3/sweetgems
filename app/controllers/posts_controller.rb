class PostsController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def show
    @post = Post.find(params[:id])
    @user ||= User.new
  end
  
  def new
    @post = Post.new
    @user ||= User.new
  end
  
  def create
    @post = Post.new(blog_params)
    @user ||= User.new
    if @post.save
      flash[:success] = "Post created!"
      redirect_to blog_path
    else
      render 'static_pages/home'
      @post.errors.full_messages.each do |msg|
        puts msg
      end
    end
  end
  
  def index
    @posts = Post.all.order('updated_at DESC').paginate(page: params[:page])
    @user ||= User.new
  end
  
  def edit
    @post = Post.find(params[:id])
    @user ||= User.new
  end
  
  def update
    @post = Post.find(params[:id])
    @user ||= User.new
    if @post.update_attributes(blog_params)
      flash[:success] = "Post updated!"
      redirect_to '/blog'
    else
      render 'edit'
    end
  end
  
  def destroy
    @user ||= User.new
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted!"
    redirect_to '/blog'
  end
  
  private
    def blog_params
      params.require(:post).permit(:title, :content)
    end
end
