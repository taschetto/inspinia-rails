class Task < ActiveRecord::Base
  belongs_to :project
  has_many :time_entries

  validates :name, presence: true
  validates :description, presence: true
  validates :project_id, presence: true
end
