class SharesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @share = Share.new
  end

  def create
    @share = Share.new(share_params)
    @share.save
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private	
    def share_params
      params.require(:share).permit(:profile_id, :post_id)
    end
end
