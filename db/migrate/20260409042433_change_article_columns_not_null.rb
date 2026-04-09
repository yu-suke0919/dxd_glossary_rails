class ChangeArticleColumnsNotNull < ActiveRecord::Migration[8.1]
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :category, false
    change_column_null :articles, :description, false
  end
end
