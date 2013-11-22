class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit]

  def account
    @user = current_user()
    if @user == nil then
      redirect_to "/"
    end
  end

  def update
    @user = current_user()
    if @user == nil then
      redirect_to "/"
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name, :school, :zip, :birth, :username, :email, :password, :password_confirmation, :country)
    end
    @user = User.update(params[:id], user_params)
    render "account"
  end

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

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to :back
  end
end
