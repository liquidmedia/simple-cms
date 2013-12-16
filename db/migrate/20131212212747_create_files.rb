class CreateFiles < ActiveRecord::Migration
  def change
    create_table :simple_cms_files do |t|
      t.attachment :upload
      t.integer :folder_id
      t.timestamps
    end
  end
end
