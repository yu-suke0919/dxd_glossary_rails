require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'body' do
    it 'コメント本文が1文字以上の場合、Commentは有効であること' do
      comment = Comment.new(comment_number: 1, body: 'a', article: FactoryBot.create(:article), user: FactoryBot.create(:user, email: 'aiueo'))
      expect(comment).to be_valid
    end

    it 'コメント本文が51文字以上の場合、Commentは無効であること' do
      comment = Comment.new(comment_number: 1, body: 'a' * 51, article: FactoryBot.create(:article), user: FactoryBot.create(:user, email: 'aiueo'))
      expect(comment).to be_invalid
    end
  end

  describe 'comment_number' do
    it 'Articleから割り当てられるコメントナンバーがなくても、Commentのvalidateは可能であること' do
      comment = Comment.new(comment_number: nil, body: 'a', article: FactoryBot.create(:article), user: FactoryBot.create(:user, email: 'aiueo'))
      expect(comment).to be_valid
    end

    it 'Articleから割り当てられるコメントナンバーがない場合、commentのsaveは不可能であること' do
      comment = Comment.new(comment_number: nil, body: 'a', article: FactoryBot.create(:article), user: FactoryBot.create(:user, email: 'aiueo'))
      expect { comment.save }.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end
