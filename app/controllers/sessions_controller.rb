class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      @session[:user_id] = @user[:id]
      redirect_to :root, notice: 'Session created!'
    else
      render :new
    end
  end

  def destroy
    @session[:user_id] = nil
    redirect_to [:sessions, :new], notice: 'Session ended!'
  end
  
end
