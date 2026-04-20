class AddArticleIdToComments < ActiveRecord::Migration[8.1]
  def up
    execute 'DELETE FROM comments;'
    add_reference :comments, :article, null: false, index: true, foreign_key: true
  end

  def down
    remove_reference :comments, :article, index: true, foreign_key: true
  end
end
