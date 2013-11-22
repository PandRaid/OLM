class Admin::DashboardController < ApplicationController
 def show
    if current_user != nil && current_user.username=="administrator"
      render "/admin/dashboard/index"
    else
      redirect_to root_path
    end
  end
end
