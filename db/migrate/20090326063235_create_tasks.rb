class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string   :name, :null => false
      t.string   :memo
      t.integer  :list_id, :null => false
      t.integer  :user_id, :null => false
      t.integer  :tag_id
      t.date :due
      t.integer  :task_status_id, :null => false

      t.timestamps
    end

    Task.create(:name => 'test',
      :memo => 'memo',
      :list_id => '1',
      :user_id => '1',
      :tag_id => '1',
      :due => '20080925',
      :task_status_id => '1'
    )
  end

  def self.down
    drop_table :tasks
  end
end
