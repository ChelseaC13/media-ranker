class WorksController < ApplicationController

  def index
    @work = Work.all

  end


  def home
    @work = Work.all

  end

  def show
    work_id = params[:id]
    @work = Work.find_by(id: work_id)
    if @work.nil?
      redirect_to root_path
      return
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params) 
    
    if @work.save 
      redirect_to works_path(@work.id)
      return
    else 
      render :new, status: :bad_request
      return
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      redirect_to works_path 
      return
    end
  end

  def update
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    elsif @work.update(work_params)
      flash[:success] = "Successfully updated #{@work.title}"
      redirect_to works_path 
      return
    else 
      flash.now[:error] = "Something happened. #{@work.title} did not updated."
      render :edit
      return
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      redirect_to work_path
      return
    end

    @work.destroy
    redirect_to works_path 
    return
    
  end


  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

end
