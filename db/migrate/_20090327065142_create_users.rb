class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.integer :user_status_id, :null => false
      t.integer :authorized_id, :null => false 
      t.integer :infomation_id
      t.string :hashed_password, :null => false
      t.string :salt, :null => false
      t.string :user_image

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
