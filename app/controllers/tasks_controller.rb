class TasksController < ApplicationController
def index
  @project = Project.find(params[:project_id])
  @iteration = Iteration.find(params[:iteration_id])
  @story = Story.find(params[:story_id])
  @tasks = Task.find(:all)

end

def new
 @story = Story.find(params[:story_id])

  @task = @story.tasks.new

end

def create
    @story = Story.find(params[:story_id])
    @task = @story.tasks.create(params[:task])
    render :action => "show"
end


def show
  @project = Project.find(params[:project_id])
@iteration = Iteration.find(params[:iteration_id])
  @story = Story.find(params[:story_id])
 @task = @story.tasks.find(params[:id])
end
end
