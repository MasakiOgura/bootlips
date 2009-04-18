class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string   :name, :null => false
      t.string   :memo
      t.integer  :list_id
      t.integer  :user_id, :null => false
      #t.integer  :tag_id
      t.string   :tag_list
      t.date :due
      t.integer  :task_status, :null => false

      t.timestamps
    end


    execute "alter table tasks add constraint fk_task_users foreign key (user_id) references users(id)"
    
  end

  def self.down
    drop_table :tasks
  end
end
