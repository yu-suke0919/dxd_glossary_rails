class ChangeCommentsUserIdNullable < ActiveRecord::Migration[8.1]
  def up
    change_column_null :comments, :user_id, true
  end

  def down
    change_column_null :comments, :user_id, false
  end
end
