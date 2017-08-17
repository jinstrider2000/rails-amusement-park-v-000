class SessionsController < ApplicationController
  
  before_action :new, :create do
    @current_user = current_user
  end

  def new

  end

  def create
    @user = User.find_by(signin_name)
    if @user.present? && @user.authenticate(signin_password)
      redirect_to user_path(@user)
    else
      flash[:error] = "Name or password incorrect, try again."
      render :new
    end
  end

  def delete
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def signin_name
    params.require(:user).permit(:name)
  end

  def signin_password
    params.require(:user).permit(:password)
  end

end
