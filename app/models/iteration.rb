class Iteration < ActiveRecord::Base
  belongs_to :project
  has_many :story
  attr_accessible :description, :end_date, :name, :start_date,:status, :iterationtype
end
