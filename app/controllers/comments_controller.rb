class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_back(fallback_location: root_path)
  end
  
  private	
    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end
