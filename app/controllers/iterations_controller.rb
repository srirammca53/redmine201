class IterationsController < ApplicationController
def index
    @project = Project.find(params[:project_id])
 
@iterations = Iteration.find(:all)
end
def new
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.new
end

def edit
    @project = Project.find(params[:project_id])
	@iteration = @project.iteration.find(params[:id])
end

def create
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.create(params[:iteration])
    render :action => "show"
end

def update
    @project = Project.find(params[:project_id])
        @iteration = @project.iteration.find(params[:id])
       raise @iteration.inspect
   if @iteration.update_attributes(params[:iteration])
       render :action => "show"
   else
                render :action => "edit"
   end
 end

def show
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:id])
    
end
end
