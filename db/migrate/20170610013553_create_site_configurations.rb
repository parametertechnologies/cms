class CreateSiteConfigurations < ActiveRecord::Migration[5.1]
  def change
    create_table :site_configurations do |t|
      t.string :key
      t.string :settings
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
