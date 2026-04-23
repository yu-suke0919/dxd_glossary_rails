class User < ApplicationRecord
  has_secure_password

  has_many :articles
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true
  validates :password, length: { minimum: 8 }, allow_nil: true
end
