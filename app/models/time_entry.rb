class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  validates :user_id, presence: true
  validates :task_id, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
