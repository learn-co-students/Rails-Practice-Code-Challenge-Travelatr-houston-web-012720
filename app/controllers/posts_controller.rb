class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :delete] 

  def index
    @posts = Post.all
  end  

  def show
  end  

  def new
    @post = Post.new
  end  

  def create
  end  

  def edit
  end  

  def update
  end

  def like_buton
    @post.update(params[:likes] += 1)
  end 
  helper_method :like_buton 

  def dislike_buton
    @post.update(params[:likes] -= 1)
  end  
  helper_method :dislike_buton 

  private 

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
  end  

end  
