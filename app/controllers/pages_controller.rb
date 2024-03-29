class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    created_posts = Post.where(cat_id: current_user.following.ids)
    shared = Share.where(profile_id: current_user.following.map {|c| c.profile.id}).to_a
    show_posts = []
    created_posts.each do |post|
      while shared.first != nil && shared.first.created_at < post.created_at do
        show_posts.push(shared.shift.post)
      end
      show_posts.push(post)
    end
    @posts = show_posts.reverse
    @random_tags = []
    i = 0
    while i < Tag.count && i < 10 do 
      offset = rand(Tag.count)
      @random_tags.push(Tag.offset(offset).first)
      i += 1
    end
  end
  def search
    @tag = Tag.find_by(name: params[:tag])
    @posts = Post.tagged_with(params[:tag])
  end
  def following
    @user = User.find(params[:id])
  end
  def favorited
    if params.has_key?(:id)
       @user = User.find(params[:id])
    else
       @user = current_user
    end
  end
end
