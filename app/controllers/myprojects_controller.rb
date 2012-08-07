class MyprojectsController < ApplicationController
def index
@projects = Project.find(:all)
 @user = User.current
@pro_arrays = Array.new
@member = Member.find(:all, :conditions => {:user_id => @user })

#@myprojects = @projects.find(:all, :conditions => {:
end 
end
