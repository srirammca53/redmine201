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
	@iteration =Iteration.find(params[:id])
end
def create
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.create(params[:iteration])
    render :action => "show"
end

def update
    @iteration = Iteration.find(params[:id])

    respond_to do |format|
      if @iteration.update_attributes(params[:iteration])
        format.html { redirect_to @iteration, notice: 'iteration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

def show
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:id])
    
end
end
