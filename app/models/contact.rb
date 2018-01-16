class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones, allow_destroy
  has_one :address, update_only: true
  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :address
end
