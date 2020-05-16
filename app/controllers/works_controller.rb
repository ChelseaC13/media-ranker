class WorksController < ApplicationController

  def index
    @work = Work.all

  end


  def home
    @work = Work.all

  end

end
