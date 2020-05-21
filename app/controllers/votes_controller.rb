class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @work = Work.find_by(id: params[:work_id])
    
    if @user == nil
      flash[:error] = "You must be logged in to vote"
      redirect_to works_path
      return
    elsif Vote.all_ready_voted(@work.id, @user.id)
      flash[:error] = "user: has already voted for this work"
      redirect_to works_path
      return
    else 
      vote = Vote.create!(user_id: @user.id, work_id: @work.id, name: "test")
      if vote.save
        flash[:success] = "#{@user.name} successfully voted for #{@work.title}"
        redirect_to works_path
        return
      else
        p "notice notice notice"
        redirect_to works_path, notice: "Failed to vote"
        return
      end
    end
  end


end
