class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def create
  end

  def update
  end

  def edit
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
  end
end
