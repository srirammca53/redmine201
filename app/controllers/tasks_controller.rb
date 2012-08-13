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
@task = Task.find(params[:id])

end

def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


def show
@project = Project.find(params[:project_id])
  @iteration = Iteration.find(params[:iteration_id])
  @story = Story.find(params[:story_id])
 @task = @story.tasks.find(params[:id])
end
def destroy
@project = Project.find(params[:project_id])
@iteration = Iterations.find(params[:iteration_id])
@story = Story.find(params[:story_id])
@task=@story.tasks.find(params[:id])
@task.destroy
end
end
