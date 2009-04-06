class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :authority_id,              :integer, :null => false
      t.column :user_status_id,            :integer
    end

    execute "alter table users add constraint fk_user_authorities foreign key (authority_id) references authorities(id)"
    execute "alter table users add constraint fk_user_user_statuses foreign key (user_status_id) references user_statuses(id)"

    add_index :users, :login, :unique => true
  end

  def self.down
    drop_table "users"
  end
end
