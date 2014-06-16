class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  #Defines user info on show.html.erb
  end

  def new
  	@user = User.new #Defines new user used in sign-up form new.html.erb
  end

  def create
  	@user = User.new(user_params)
  	if  @user.save
      sign_in @user
  		flash[:success] = "You have successfully created an account. Welcome to the ihouse complaint web platform!"
  		redirect_to @user
  	else
  		render 'new'
  	end	
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
