class TimereportsController < ApplicationController

	def index 
		@user = User.current
		@project = Project.find(params[:project_id])
		@iteration = @project.iteration.find(params[:iteration_id])
		@story = @iteration.story.find(params[:story_id])
		@task = @story.tasks.find(params[:task_id])
			
	end

	def new
		@report = Timereports.new
 
		@report.inspect
	end	
end
