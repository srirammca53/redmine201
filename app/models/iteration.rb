class Iteration < ActiveRecord::Base
  belongs_to :project
  attr_accessible :description, :end_date, :name, :start_date
end
