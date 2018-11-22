class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
      @posts = Post.where(cat_id: current_user.following.ids)
  end
  def search
    @tag = Tag.find_by(name: params[:tag])
    @posts = Post.tagged_with(params[:tag])
  end
  def favorited
    if params.has_key?(:id)
       @user = User.find(params[:id])
    else
       @user = current_user
    end
  end
end
