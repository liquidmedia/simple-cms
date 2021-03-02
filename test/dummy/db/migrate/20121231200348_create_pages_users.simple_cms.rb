# This migration comes from simple_cms (originally 20121226204357)
class CreatePagesUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :pages_users, :id => false do |t|
      t.integer :page_id, :null => false
      t.integer :user_id, :null => false
    end
  end
end
