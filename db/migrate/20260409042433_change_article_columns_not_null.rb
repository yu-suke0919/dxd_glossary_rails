class ChangeArticleColumnsNotNull < ActiveRecord::Migration[8.1]
  def change
    change_column_null :article, :title, false
    change_column_null :article, :category, false
    change_column_null :article, :description, false
  end
end
