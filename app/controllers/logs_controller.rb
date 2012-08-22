class LogsController < ApplicationController
  # GET /logs
  # GET /logs.json
 def index
  
  @tasks = Task.find(:all)
  @logs = Logs.find(:all)
end

def new
   
    @task = Task.find(params[:task_id])
    @log = Log.new(params[:logs])
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
	    
    @log = @task.logs.build(params[:log])
   
    if @log.save 
        #raise "hi"
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
end
