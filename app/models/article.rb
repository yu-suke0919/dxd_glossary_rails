class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :category, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments

  scope :recent, -> { order(created_at: :desc) }
  def self.ransackable_attributes(auth_object = nil)
    %w[title body created_at]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
