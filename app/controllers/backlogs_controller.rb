class BacklogsController < ApplicationController

def index
	@stories = Story.find(:all , :conditions => {:iteration_id => 989 })
	render :action => "index"
end
def assign
@tasks = params[:tasks]
@iteration = params[:name]
end
end
