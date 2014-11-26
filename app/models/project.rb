class Project < ActiveRecord::Base
  belongs_to :organization

  validates :name, presence: true
  validates :description, presence: true
  validates :organization_id, presence: true
end
