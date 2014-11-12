class Organization < ActiveRecord::Base
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
end
