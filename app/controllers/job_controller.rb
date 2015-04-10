class JobController < ApplicationController
  before_filter :authenticate_admin!, only: [:admin_show]

  def hunters
  	@profiles = Profile.all
  end

  def admin_show
    @profiles = Profile.all
  end

end
