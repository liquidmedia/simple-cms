class CreatePages < ActiveRecord::Migration
  def change
    create_table :ckeditor_pages do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :url

      t.string :type

      t.timestamps
    end
  end
end
