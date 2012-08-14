class Task < ActiveRecord::Base
  belongs_to :story
  has_many :logs
  attr_accessible :acceptor, :description, :disposition, :estimated_hours, :name, :task_type
end
