class BloggersController < ApplicationController
  before_action :current_blogger, only: [:update,:show,:edit, :destroy]
  def index
    @bloggers =Blogger.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(strong_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages
      redirect_to new_blogger_path
    end
    
  end
  
  def show
 
  end

  def edit 
  end
  def update 
    @blogger.update(strong_params)
    redirect_to blogger_path(@blogger)
  end
  
  def destroy
    @blogger.destroy 
    redirect_to bloggers_path
  end

  private 
  def current_blogger 
    @blogger = Blogger.find(params[:id])
  end
  def strong_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
