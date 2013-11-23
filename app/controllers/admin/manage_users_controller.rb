class Admin::ManageUsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  def list
  	if current_user != nil && current_user.admin?
      @users = User.paginate(page: params[:page], :per_page=>10)
      render "/admin/manage_users/list"
    else
      redirect_to root_path
    end
  end
end
