class FavoritesController < ApplicationController
  respond_to :html, :js
  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(comment_params)
    @favorite.save
  #  redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private	
    def comment_params
      params.require(:favorite).permit(:user_id, :post_id)
    end

end
