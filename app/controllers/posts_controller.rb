class PostsController < ApplicationController
    before_action :current_post, only: [:edit, :show, :destroy]
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new 
        @bloggers = Blogger.all 
        @destinations = Destination.all
    end

    def create
        post = Post.new(params_post)
        
        if post.valid?
            post.save
            redirect_to post
        else
            flash[:errors] = post.errors.full_messages
            redirect_to new_post_path


        end
    end

    def edit
        @bloggers = Blogger.all 
        @destinations = Destination.all

    end
    def update
        @post.update(params_post)
        redirect_to post_path(@post)
    end

    def show
    end

    def destroy
        @post.destroy 
        redirect_to posts_path
    end

    private

    def current_post
        @post = Post.find(params[:id])
    end

    def params_post
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
