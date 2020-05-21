class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @work = Work.find_by(id: params[:work_id])
    p "hererererere #{params}"
    p "000000000000000 #{@work.title}"
    if @user == nil
      p "nilnilnil"
      flash[:error] = "You must be logged in to vote"
      return
    else
      vote = Vote.create!(user_id: @user.id, work_id: @work.id, name: "test")
      if vote.save
        p "save save save "
        redirect_to works_path
        return
      else
        p "bad bad bad "
        redirect_to works_path, notice: "Failed to vote"
        return
    end
      return
    end
  end


end
