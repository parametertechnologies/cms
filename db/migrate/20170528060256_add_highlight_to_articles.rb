class AddHighlightToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :highlight, :boolean, default: false
  end
end
