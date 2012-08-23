class IterationsController < ApplicationController
def index
    @project = Project.find(params[:project_id])
 
@iterations = Iteration.find(:all)
end
def new
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.new
end

def edit
    @project = Project.find(params[:project_id])

	@iteration = @project.iteration.find(params[:id])

end

def create
    @project = Project.find(params[:project_id])
	raise params[:iteration].inspect
    @iteration = @project.iteration.new(params[:iteration])
	@flag = 0
   @project.iteration.each do |it|
     #raise   @iteration.start_date.inspect
      
          if it.end_date >= @iteration.start_date
 		 @flag+=  1
	  end

    end
  
   if @flag.to_i == 1
     @iteration.save
     flash[:notice] = "record saved "
   
  elsif @flag.to_i > 0
	flash[:notice] = "record not saved "
 	render :action => "new" and return
        
end
    
    render :action => "show"
end

def update
   @project = Project.find(params[:project_id])

	@iteration = @project.iteration.find(params[:id])
   
   if @iteration.update_attributes(params[:iteration])
       render :action => "show"
   else
                render :action => "edit"
   end
 end

def show
    @project = Project.find(params[:project_id])
    @iteration = @project.iteration.find(params[:id])
    
end
end
