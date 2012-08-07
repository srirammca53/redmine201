class UserTasksController < ApplicationController
def index
  @iteration = Story.find(params[:story_id])
@tasks = UserTask.find(:all)

end

def new

end

def create

end

def show

end

end
