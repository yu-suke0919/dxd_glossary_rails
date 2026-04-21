class AddNextCommentNumberToArticles < ActiveRecord::Migration[8.1]
  def change
    add_column :articles, :next_comment_number, :integer, null: false, default: 1
  end
end
