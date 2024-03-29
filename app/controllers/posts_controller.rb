class PostsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js, :json, :html
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
   @post = Post.new
  end

  def create
    @post = Cat.find(post_params[:cat_id]).posts.build(post_params)
    if @post.save 
     # flash[:sucess] = "Professor created succesfully"
      redirect_to cat_path(Cat.find(post_params[:cat_id]))
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    cat = @post.cat
    @post.destroy
    redirect_to cat_path(cat)
  end

  def vote
   @post = Post.find(params[:id])
   if !current_user.favorited?(@post)
      @favorite = Favorite.new(user_id: current_user.id, post_id: @post.id)
      @favorite.save
   else 
      @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
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
