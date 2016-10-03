class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create
    @user = User.new(user_params) #for other params
    #@user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end
  
  def edit
  	@user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash.notice = "User Profile updated!"
    new
    render :new
  end


  private


  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
end
