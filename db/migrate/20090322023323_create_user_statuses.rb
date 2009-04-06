class CreateUserStatuses < ActiveRecord::Migration
  def self.up
    create_table :user_statuses do |t|
      t.integer :status_id, :null => false
      t.string :status_name, :null => false
      t.string :image_path, :null => false

      t.timestamps
    end

    UserStatus.create(
      :status_id => '1',
      :status_name => 'Grate!',
      :image_path => '/images/icons/emotion_grate.png'
    )
   UserStatus.create(
      :status_id => '2',
      :status_name => 'OK',
      :image_path => '/images/icons/emotion_ok.png'
    )
    UserStatus.create(
      :status_id => '3',
      :status_name => 'Bad!',
      :image_path => '/images/icons/emotion_bad.png'
    )


  end

  def self.down
    drop_table :user_statuses
  end
end
