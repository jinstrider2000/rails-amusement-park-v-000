class UsersController < ApplicationController

  before_action :current_user, except: [:create]
  
  def new
    redirect_to user_path(@current_user) if @current_user.present?
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def show
    redirect_to root_path if @current_user.nil?
    if params[:attraction_id].present?
      @user = @current_user
      ride = @user.rides.find_by(attraction_id: params[:attraction_id])
      if ride.nil?
        @user.attraction_ids = @user.attraction_ids << params[:attraction_id]
        ride = @user.rides.find_by(attraction_id: params[:attraction_id])
      end
      flash[:alert] = ride.take_ride
    else
      @user = User.find_by(id: params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:password,:height,:tickets,:happiness,:nausea,:created_at,:admin)
  end
end
