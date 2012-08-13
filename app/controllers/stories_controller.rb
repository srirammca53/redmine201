class StoriesController < ApplicationController


def index
@project = Project.find(params[:project_id])
  @iteration = Iteration.find(params[:iteration_id])
@stories = Story.find(:all)

end

def new

 @iteration = Iteration.find(params[:iteration_id])

@story = @iteration.story.new

end

def create
	@project = Project.find(params[:project_id])
	 @iteration = Iteration.find(params[:iteration_id])
      @story = @iteration.story.create(params[:story])	
   
       render :action => "show"
end


def show
@project = Project.find(params[:project_id])
@iteration = Iteration.find(params[:iteration_id])
 @story = @iteration.story.find(params[:id])
end
def edit
	@project = Project.find(params[:project_id])
   @iteration = Iteration.find(params[:iteration_id])
   @story = @iteration.story.find(params[:id])
end
end
