class SessionsController < ApplicationController
def create
  @user = User.new(params[:user])
  user = User.find_by_name_and_password(params[:name], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Welcome #{current_user.name}"
  else
    redirect_to root_path, :notice => "Incorrect Password"
  end
end

  def destroy
    reset_session
    redirect_to root_path, :notice => "Logged Out"
  end
end
