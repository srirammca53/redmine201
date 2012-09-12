class LogsController < ApplicationController
  # GET /logs
  # GET /logs.json


 def index
  
  @tasks = Task.find(:all)
  @logs = Logs.find(:all)
end

def new

    @task = Task.find(params[:task_id])
    @log = Log.new

 render :layout => false
end

def create
  
    @task = Task.find(params[:task_id]) # task id
    @st = Story.find(:all, :conditions => {:id => @task.story_id})
    @st.each do |st|
     @stid = st.id # story id
    @stit_id = st.iteration_id 
 
	end
	
	
 @it = Iteration.find(:all, :conditions => {:id => @stit_id})

  @it.each do |it|
   @itid =it.id # iteration id
    @itpro_id = it.project_id 
	
	end
  
  @proid = Project.find(:all, :conditions => {:id =>  @itpro_id})
  
   @proid.each do |pro|
    @pro_id = pro.id   # project id 
	end
     
    @logs = @task.logs.create(params[:log])
    if @logs.save
                  
		redirect_to project_iteration_story_tasks_path( @pro_id, @itid, @stid )
		else
		raise "bad"
    end
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


def send_mails
raise "yes".inspect
end

def update_tasks
	@log = params[:spent_hours]
	@date = params[:reported_date]
	@current_task = params[:task_id]
	@description = params[:description]
	@task = Task.find(@current_task)
        @remaining_time = @task.estimated_hours.to_i - @log.to_i
	@user = User.current.lastname
        #@log_exist = Log.find(:all , :conditions => {:task_id => @current_task})
	@log = @task.logs.create(:spent_hours => @log,:report_date => @date.to_date,:user1 => @user, :task_id=>@current_task,:remaining_time => @remaining_time,:description => @description)
	redirect_to    my_page_path
end

end
