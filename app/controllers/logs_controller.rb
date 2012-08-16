class LogsController < ApplicationController
  # GET /logs
  # GET /logs.json
 def index
  @project = Project.find(params[:project_id])
  @iteration = Iteration.find(params[:iteration_id])
  @story = Story.find(params[:story_id])
  @tasks = Task.find(:all)
  @logs = Logs.find(:all)
end

def new
 @task = Task.find(params[:task_id])

  @log = @task.logs.new

end

def create
    @user = User.find(:all)
    @task = Task.find(params[:task_id])
    @log = @task.logs.create(params[:log])

	
    render :action => "show"
end

def show
@task= Task.find(params[:task_id])
@log = @task.log.find(params[:id])
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

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log = Log.find(params[:id])
    @log.destroy

    respond_to do |format|
      format.html { redirect_to logs_url }
      format.json { head :no_content }
    end
  end

def filter
@project = Project.find(params[:project_id])
@iteration = @project.iteration.find(params[:iteration_id])
@story = @iteration.story.find(params[:story_id])
@task = @story.tasks.find(params[:task_id])


raise "filter".inspect
end
end
