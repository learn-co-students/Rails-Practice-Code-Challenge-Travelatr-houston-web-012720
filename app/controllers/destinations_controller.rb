class DestinationsController < ApplicationController
  before_action :current_destination, only: [:show,:update,:edit,:destroy]
  def index
    @destinations = Destination.all
  end

  def show
  end

  def new
    @destination = Destination.new
  end

  def edit
  end
  def create
    @destination = Destination.create(strong_params)
    redirect_to destination_path(@destination)
  end
  def update
    @destination.update(strong_params)
    redirect_to destination_path(@destination)
  end
  def destroy
    @destination.destroy
    redirect_to destinations_path
  end
  private 
  def current_destination
    @destination = Destination.find(params[:id])
  end
  def strong_params
    params.require(:destination).permit(:name,:country)
  end
end
