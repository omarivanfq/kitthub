class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.new
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_session_path
  end
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :dob)
    end
end
