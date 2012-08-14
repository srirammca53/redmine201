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
    @user = User.find(:all)
    @story = Story.find(params[:story_id])
    @task = @story.tasks.create(params[:task])

	@user.each do |usr|
		if @task.acceptor == usr.lastname
		@usermail = usr
		
		end
        end 
	if @task.save 
	   TaskMailer.task_creation(@usermail).deliver
	end
    render :action => "show"
end

def edit
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:iteration_id])
    @story = @iteration.story.find(params[:story_id])
    @task = @story.tasks.find(params[:id])
end

def update
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:iteration_id])
    @story = @iteration.story.find(params[:story_id])
    @task = @story.tasks.find(params[:id])
 	@user = User.find(:all)
 	@user.each do |usr|
		if @task.acceptor == usr.lastname
		@usermail = usr
		
		end
        end 
    if @task.update_attributes(params[:task])
	TaskMailer.task_update(@usermail).deliver
        render :action => "show"
    else
		 render :action => "edit"
    end

end


def show
@project = Project.find(params[:project_id])
  @iteration = Iteration.find(params[:iteration_id])
  @story = Story.find(params[:story_id])
 @task = @story.tasks.find(params[:id])

end

def delete
   raise "demo".inspect
end


end
