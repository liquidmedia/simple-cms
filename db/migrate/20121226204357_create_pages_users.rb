class CreatePagesUsers < ActiveRecord::Migration
  def change
    create_table :pages_users, :id => false do |t|
      t.integer :page_id, :null => false
      t.integer :user_id, :null => false
    end
  end
end
