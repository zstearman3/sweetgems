class PostsController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]
  
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
    @posts = Post.all.paginate(page: params[:page])
  end
  
  private
    def blog_params
      params.require(:post).permit(:title, :content)
    end
end
