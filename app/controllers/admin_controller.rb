class AdminController < ApplicationController
  before_action :validate_admin
  
  def index
    @users = User.all
  end

  def edit_user
  end
end

