class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :admin, :default => false, :null => false

      t.timestamps
    end
  end
end
