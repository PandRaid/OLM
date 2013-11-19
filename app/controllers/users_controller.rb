class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  
  def new
    @user = User.new
  end

  def create
    def user_params
      params.require(:user).permit(:first_name, :last_name, :school, :zip, :birth, :username, :email, :password, :password_confirmation, :country)
    end 
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
