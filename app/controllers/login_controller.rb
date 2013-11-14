class LoginController < ApplicationController
  def new
  end

  def create
  	@badForm=false;
  	user = User.find_by_email(params[:email])
  	if user == nil
  		user = User.find_by_username(params[:email])
  	end
	if user && user.authenticate(params[:password])
	  @badForm=false;
	  session[:user_id] = user.id
	  redirect_to root_url, :notice => "Logged in!"
	else
	  @badForm=true;
	  flash.now.alert = "Invalid email or password"
	  render "new"
	end
end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
