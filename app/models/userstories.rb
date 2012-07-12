class Userstories < ActiveRecord::Base
  belongs_to :version
  attr_accessible :customer, :description, :disposition, :estimated_hours, :name, :order, :priority, :status, :tracker

end
