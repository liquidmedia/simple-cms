# This migration comes from simple_cms (originally 20121226204342)
class CreatePages < ActiveRecord::Migration[4.2]
  def change
    create_table :simple_cms_pages do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :url

      t.string :type

      t.timestamps
    end
  end
end
