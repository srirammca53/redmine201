class Story < ActiveRecord::Base
  belongs_to :iteration
  attr_accessible :Estimated_hours, :customer, :description, :name, :order, :priority, :status, :tracker
end
