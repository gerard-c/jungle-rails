class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate_with_credentials

    if user
      session[:user_id] = user.id
      redirect_to :root, notice: 'Session created!'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Session ended!'
  end

end
