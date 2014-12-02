class Task < ActiveRecord::Base
  belongs_to :project
  has_many :time_entries
  before_destroy :check_for_time_entries

  validates :name, presence: true
  validates :description, presence: true
  validates :project_id, presence: true

  private

    def check_for_time_entries
      if time_entries.any?
        errors[:base] << "Cannot delete task that has time entries."
        return false
      end
    end
end
