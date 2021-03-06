class UsersController < ApplicationController

  def index
    @users = User.all.order(:created_at)
  end

  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    if @user.nil?
      head :not_found
      return
    end
  end

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

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
    return
  end

  private

  def user_params
    return params.require(:user).permit(:name)
  end
end
