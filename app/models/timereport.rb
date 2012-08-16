class Timereport < ActiveRecord::Base
  belongs_to :user
  attr_accessible :end_date, :start_date, :user
end
