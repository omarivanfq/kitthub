class CatsController < ApplicationController
  def show
    @cat = Cat.find(params[:id])
  end

  def new 
    @cat = current_user.cats.build #Cat.new
  end

  def create
    @cat = current_user.cats.build(cat_params) #Cat.new(cat_params)
    if @cat.save 
     # flash[:sucess] = "Professor created succesfully"
      redirect_to user_path(User.find(@cat.user_id))
    else
      render :new
    end
  end

  private	
    def cat_params
      params.require(:cat).permit(:name, :username, :dob, :breed_id)
    end
end
