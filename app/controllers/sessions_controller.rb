class SessionsController < ApplicationController

  def new
  end

  def create #NB here we are creating a new session (different from creating a new user)
  	user = User.find_by(email: params[:session][:email].downcase) #downcase because thats how it is saved in model/user.rb
  	if user && user.authenticate(params[:session][:password]) #if user's email corresponds to authenticate
  		sign_in user #sign in and go to profile page (show.html.erb)
      redirect_to user
  	else
  		flash.now[:error] = "Invalid email or password" #flash.now will display flash on rendered pages
  														# but it disappears with any additional request
	  	render 'new' #gives a fresh sign in page
  	end
  end

  def destroy
    sign_out #sign out defined in session helper
    redirect_to root_url
  end
end