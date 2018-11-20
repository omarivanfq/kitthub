class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
      @posts = Post.where(cat_id: current_user.following.ids)
  end
  def search
    @tag = Tag.find_by(name: params[:tag])
    @posts = Post.tagged_with(params[:tag])
  end
end
