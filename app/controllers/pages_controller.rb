class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @posts = Post.where(cat_id: current_user.following.ids)
  end
end
