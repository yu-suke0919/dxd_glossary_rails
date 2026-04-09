class ChangeArticleTitleUnique < ActiveRecord::Migration[8.1]
  def change
    add_index :articles, :title, unique: true
  end
end
