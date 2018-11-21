class PostsController < ApplicationController
 # before_action :set_post, only [:vote]
  respond_to :js, :json, :html
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(post_params)#current_user.cats.build(cat_params) #Cat.new(cat_params)
    if @post.save 
     # flash[:sucess] = "Professor created succesfully"
      redirect_to cat_path(Cat.find(@post.cat_id))
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def vote
   @post = Post.find(params[:id])
   if !current_user.favorited?(@post)
      @favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
      @favorite.save
   else 
      @favorite = Favorite.find_by(user_id: current_user.id)
      @favorite.destroy
   end
    respond_to do |format|
      format.js
    end
  end

  private	
    def post_params
      params.require(:post).permit(:body, :all_tags, :picture, :cat_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
