class AdminController < ApplicationController
	before_filter :authenticate_admin!

  def all_users
  	@user = User.all
  end


end
