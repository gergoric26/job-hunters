class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_load_resource :only => [:create]



  # GET /profiles
  # GET /profiles.json
  def index
    user = User.find(params[:user_id])
    @profiles = user.profiles

    respond_to do |format|
      format.html
      format.xml {render :xml => @profiles}
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    user = User.find(params[:user_id])
    @profiles = user.profiles.find(params[:id])

    respond_to do |format|
      format.html
      format.xml {render :xml => @profile}
      end
  end

  # GET /profiles/new
  def new
    user = User.find(params[:user_id])
    @profile = user.profiles.build

    respond_to do |format|
      format.html
      format.xml {render :xml => @profile}
      end
  end

  # GET /profiles/1/edit
  def edit
    user = User.find(params[:user_id])
    @profiles = user.profiles.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    user = User.find(params[:user_id])
    @profile = current_user.profiles.create(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to user_profiles_url, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    user = User.find(params[:user_id])
    @profiles = user.profiles.find(params[:id])

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to user_profile_url, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    user = User.find(params[:user_id])
    @profiles = user.profiles.find(params[:id])
    
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to job_hunters_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :full_name, :phone_number, :email, :position, :years_of_experiance, :cover_letter, :resume, :reference)
    end
end
