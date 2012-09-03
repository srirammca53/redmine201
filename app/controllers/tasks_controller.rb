class TasksController < ApplicationController


def index
  
  @project = Project.find(params[:project_id])
  @iteration = Iteration.find(params[:iteration_id])
  @story = Story.find(params[:story_id])
  @tasks = Task.find(:all)
	@logs = Log.find(:all)
end

def new
 @story = Story.find(params[:story_id])

  @task = @story.tasks.new

end

def create
    @user = User.find(:all)
    @story = Story.find(params[:story_id])
    @task = @story.tasks.create(params[:task]) 
    @stid = @story.name
    @it = Iteration.find(:all , :conditions => {:id => @story.iteration_id }) 
    @it.each do |iname|  @iname = iname.name end 
	
	@user.each do |usr|
		if @task.acceptor == usr.lastname
		@usermail = usr
		
		end
        end 
	if @task.save
		@tid = @task.id
          
	   TaskMailer.task_creation(@usermail,@iname,@tid).deliver
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
	 @week = Date.today - @task.last_mail.to_date
	 @last_mail = @task.last_mail
	 @taskid = @task.id
	if @week == 7/1
		TaskMailer.task_update(@usermail,@taskid,@last_mail).deliver
	end 
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

def log
 redirect_to :controller=> :logs, :action => :new
 render :layout => false
end

def total_tasks
	
	
end
def update_tasks
	
	raise "yes".inspect
end
end
