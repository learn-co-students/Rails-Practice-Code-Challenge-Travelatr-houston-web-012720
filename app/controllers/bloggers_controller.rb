class BloggersController < ApplicationController

  before_action :set_blogger, only: [:show, :edit, :update, :destroy]

  def index
    @bloggers = Blogger.all
  end  

  def show
  end  

  def new
    @blogger = Blogger.new
  end  

  def create

    @blogger = Blogger.new(blogger_params)

    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      redirect_to new_blogger_path 
    end  
  end  

  def edit
  end  

  def update
    if @blogger.name != params[:name]
      if @blogger.valid?
        @blogger.update(blogger_params)
        redirect_to blogger_path(@blogger)
      else
        redirect_to edit_blogger_path 
      end
    else
      if @blogger.valid?(:special_context)
        @blogger.update(blogger_params)
        redirect_to blogger_path(@blogger)
      else
        redirect_to edit_blogger_path 
      end
    end  
  end  

  private

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end  

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end  

end  
