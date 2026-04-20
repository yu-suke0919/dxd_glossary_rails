class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :category, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments
end
