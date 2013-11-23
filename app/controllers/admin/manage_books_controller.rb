class Admin::ManageBooksController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  def list
    if current_user != nil && current_user.admin?
      @books = Book.paginate(page: params[:page], :per_page=>10)
      render "/admin/manage_books/list"
    else
      redirect_to root_path
    end
  end

  def delete
    if current_user != nil && current_user.admin?
      Book.delete(params[:id])
      @books = Book.paginate(page: params[:page], :per_page=>10)
      render "/admin/manage_books/list"
    else
      redirect_to root_path
    end
  end
end
