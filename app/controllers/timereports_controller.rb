class TimereportsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:iteration_id])
    @story = @iteration.story.find(params[:story_id])
    @task = @story.tasks.find(params[:task_id])
    @timereports = Timereport.all
  end

  def show
    @timereport = Timereport.find(params[:id])
  end

  def new
    @timereport = Timereport.new

  end


  def edit
    @timereport = Timereport.find(params[:id])
  end

  def create

    @timereport = Timereport.new(params[:timereport])

    respond_to do |format|
      if @timereport.save
       redirect_to @timereport
        
      else
         render action: "new" 
       
      end
    end
  end

  
  def update
    @timereport = Timereport.find(params[:id])

    respond_to do |format|
      if @timereport.update_attributes(params[:timereport])
         redirect_to @timereport
        
      else
       render action: "edit" 
      end
    end
  end

  def destroy
    @timereport = Timereport.find(params[:id])
    @timereport.destroy
  end
end
