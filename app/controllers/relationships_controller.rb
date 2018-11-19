class RelationshipsController < ApplicationController
  def create 
    cat = Cat.find(params[:followed_id])
    current_user.follow(cat)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    cat = Relationship.find(params[:id]).followed
    current_user.unfollow(cat)
    redirect_back(fallback_location: root_path)
  end
end
