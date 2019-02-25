class SessionsController < ApplicationController

  def new
    @user ||= User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
     else
       render html: helpers.tag.strong('Invalid Login Information')
     end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
