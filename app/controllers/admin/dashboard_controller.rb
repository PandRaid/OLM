class Admin::DashboardController < ApplicationController
 def show
    if current_user != nil && current_user.admin?
      render "/admin/dashboard/index"
    else
      redirect_to root_path
    end
  end
end
