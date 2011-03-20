class Admin::BaseController < ApplicationController
  before_filter do
    authenticate_user!
    redirect_to root_path unless current_user.is_admin?
  end
end
