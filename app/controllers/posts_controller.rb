class PostsController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(blog_params)
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
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(blog_params)
      flash[:success] = "Post Updated!"
      redirect_to '/blog'
    else
      render 'edit'
    end
  end
  
  private
    def blog_params
      params.require(:post).permit(:title, :content)
    end
end
