class Log < ActiveRecord::Base
  belongs_to :task
  attr_accessible :estimated_time, :remaining_time, :report_date, :spent_hours, :user1, :user2,:description
end
