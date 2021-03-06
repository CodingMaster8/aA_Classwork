class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]

  # log in 
  def new 
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    if user
      login!(user)
      redirect_to cats_url
    else
      render :new
    end
  end

  # log out 
  def destroy
    current_user.reset_session_token! if current_user 
    render :new
  end

end
