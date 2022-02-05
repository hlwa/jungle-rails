class Category < ActiveRecord::Base

  has_many :products

  validates :name, presence: true
  validates :created_at, presence: false
  validates :updated_at, presence: false

end
