class UserstoriesController < ApplicationController
def index
	respond_to do |format|
      format.html {
        @Userstories = Userstories.find(:all)
      }
 		end
end
end
