class Comment < ApplicationRecord
  validates :comment_number, presence: true
  validates :description, presence: true, length: { maximum: 50 }

  belongs_to :article
end
