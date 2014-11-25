class Project < ActiveRecord::Base
  belongs_to :organization

  validates :title, presence: true
  validates :description, presence: true
  validates :organization_id, presence: true
end
