class IterationsController < ApplicationController
def index
    @project = Project.find(params[:project_id])
 
@iterations = Iteration.find(:all)
end
def new
    @project = Project.find(params[:project_id])

@iteration = @project.iteration.new
end
def create
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.create(params[:iteration])
    render :action => "show"
end
def show
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:id])
    
end
end
