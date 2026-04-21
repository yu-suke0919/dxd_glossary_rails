module Comments
  class CreateService
    def call(article:, params:)
      comment = article.comments.new(params)
      return comment unless comment.valid?
      article.with_lock do
        ApplicationRecord.transaction do
          comment.comment_number = article.next_comment_number
          article.increment!(:next_comment_number)
          comment.save!(context: :validate_comment_number)
        end
      end
      comment
    end
  end
end
