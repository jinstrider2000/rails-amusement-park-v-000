class AttractionsController < ApplicationController
  
  before_action :show, :edit, :update do
    @current_user = current_user
    @attraction = Attraction.find_by(params[:id])
  end

  def new
    @current_user = current_user
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    @attractions = Attraction.all
  end

  def show
    
  end

  def edit
    
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name,:min_height,:nausea_rating,:happiness_rating,:tickets)
  end

end
