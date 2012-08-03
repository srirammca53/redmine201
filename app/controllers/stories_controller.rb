class StoriesController < ApplicationController


def index
  @iteration = Iteration.find(params[:iteration_id])
@userstories = Story.find(:all)

end

def new
 @iteration = Iteration.find(params[:iteration_id])

@story = @iteration.story.new

end

def create
 @iteration = Iteration.find(params[:iteration_id])
    @storie = @iteration.story.create(params[:story])
    render :action => "show"
end


def show
@iteration = Iteration.find(params[:iteration_id])
 @storie = @iteration.story.find(params[:id])
end
end
