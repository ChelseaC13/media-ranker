class UsersController < ApplicationController

  def login_form
    @user = User.new
  end


  def login
    username = params[:user][:name]
    @user = User.find_by(name: username)
    if @user
      flash[:success] = "Successfully logged in as returning user #{username}"
    else
      @user = User.create(name: username)
      flash[:success] = "Successfully logged in as new user #{username}"
    end
    session[:user_id] = @user.id
    redirect_to root_path
    return
  end

  def current
    @current_user = User.find_by(id: session[:user_id])
    p " this is the current user #{current}"  # get rid of thiiiiiiiiisssssssssss
    unless @current_user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
      return
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
    return
  end
end
