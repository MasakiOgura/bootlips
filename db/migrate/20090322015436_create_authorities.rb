class CreateAuthorities < ActiveRecord::Migration
  def self.up
    create_table :authorities do |t|
      t.integer :authority_id, :null => false
      t.string :authority_name, :null => false

      t.timestamps
    end

    Authorities.create(
      :authority_id => 1,
      :authority_name => '管理者'
    )
    Authorities.create(
      :authority_id => 2,
      :authority_name => '一般ユーザ'
    )

  end

  def self.down
    drop_table :authorities
  end
end
