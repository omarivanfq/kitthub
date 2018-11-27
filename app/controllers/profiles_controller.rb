class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def create
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to cat_path(@profile.cat)
  end

  def edit
   @profile = Profile.find(params[:id])
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
  end

  private	
    def profile_params
      params.require(:profile).permit(:biography, :picture)
    end
end
