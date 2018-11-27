class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:sucess] = "Comment edited succesfully"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private	
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end
