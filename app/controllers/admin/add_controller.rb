class Admin::AddController < ApplicationController
  def new
    if current_user != nil && current_user.admin?
      @admin = User.new
    else
      redirect_to root_path
    end
  end

  def create
	  if current_user != nil && current_user.admin?
	    def my_params
	      params.require(:user).permit(:first_name, :last_name, :school, :zip, :birth, :username, :email, :password, :password_confirmation, :country, :admin)
	    end 
	    @admin = User.new(my_params)
	    @admin.admin = true;
	    if @admin.save
	      redirect_to "/admin/dashboard/index", :notice => "Signed up!"
	    else
	      render "/admin/add/new"
	    end
	   end
  end
end
