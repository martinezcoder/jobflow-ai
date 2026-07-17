class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 100 }
end
