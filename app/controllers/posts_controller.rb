class PostsController < ApplicationController
  before_action :post_find, only: [:show, :edit, :update, :destroy]
  def index
    @posts=Post.all.order("created_at DESC")
  end

  def new
    @post=Post.new
  end
  def create
    @post=Post.new(post_parameter)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  end
  def edit
  end
  def update
    if @post.update(post_parameter)
      redirect_to @post
    else
      render "edit"
  end
end
  def destroy
    @post.destroy
    redirect_to root_path
  end
  private

  def post_find
    @post=Post.find(params[:id])
  end
    def post_parameter
        params.require(:post).permit(:title,:body)
    end
end
