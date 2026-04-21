class Comment < ApplicationRecord
  validates :comment_number, presence: true, on: :validate_comment_number
  validates :body, presence: true, length: { maximum: 50 }

  belongs_to :article
end
