class Organization < ActiveRecord::Base
  has_many :projects
  has_many :users
  before_destroy :check_for_projects
  usar_como_cnpj :cnpj

  validates :name,      presence: true
  validates :full_name, presence: true
  validates :cnpj,      presence: true
  validates :address1,  presence: true
  validates :zipcode,   presence: true
  validates :city,      presence: true
  validates :state,     presence: true
  validates :country,   presence: true
  validates :website,   presence: true
  validates :primary_email, presence: true

  private

    def check_for_projects
      if projects.any?
        errors[:base] << "Cannot delete organization that has projects."
        return false
      end
    end
end
