class AddUserIdToComments < ActiveRecord::Migration[8.1]
  def up
    execute "DELETE FROM comments;"
    add_reference :comments, :user, null: false, index: true, foreign_key: true
  end

  def down
    remove_foreign_key :comments, :user
    remove_reference :comments, :user, index: true
  end
end
