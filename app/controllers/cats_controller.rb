class CatsController < ApplicationController
  def show
    @cat = Cat.find(params[:id])
    @post = Post.new
  end

  def new 
    @cat = current_user.cats.build #Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end
 
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:sucess] = "Cat edited succesfully"
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def create
    @cat = current_user.cats.build(cat_params) #Cat.new(cat_params)
    @cat.profile = Profile.new
    if @cat.save 
     # flash[:sucess] = "Professor created succesfully"
      redirect_to user_path(User.find(@cat.user_id))
    else
      render :new
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    user = @cat.user
    @cat.destroy
    redirect_to user_path(user)
  end

  private	
    def cat_params
      params.require(:cat).permit(:name, :username, :dob, :breed_id)
    end
end
