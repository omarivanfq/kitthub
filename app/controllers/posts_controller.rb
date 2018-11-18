class PostsController < ApplicationController
  def show
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

  private	
    def post_params
      params.require(:post).permit(:body, :picture, :cat_id)
    end
end
