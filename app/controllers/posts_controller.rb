class PostsController < ApplicationController
  before_action :current_post, only: [:show,:update,:edit,:destroy,:like]
  def index
    @posts = Post.all
  end

  def like 
    @post.likes +=1 
    @post.save
    redirect_to post_path(@post)
  end

  def show
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all 
    @destinations = Destination.all 
  end

  def edit
    @bloggers = Blogger.all
    @destinations = Destination.all
  end
  def create
  
    @post = Post.new(strong_params)
    if @post.valid?
      @post.likes = 0
      @post.save
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_path
    end
    
 



  end
  def update
    @post.update(strong_params)
    redirect_to post_path(@post)
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  private 
  def current_post
    @post = Post.find(params[:id])
  end
  def strong_params
    params.require(:post).permit(:title,:content, :blogger_id, :destination_id)
  end


end
