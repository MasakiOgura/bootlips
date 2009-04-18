class Task < ActiveRecord::Base
  validates_presence_of :name, :message => "name が空です"

  # for acts_as_taggable_redux
  acts_as_taggable
  
  has_many :users

  TASK_STATUSES = [
    [ "未着手", "1"],
    [ "作業中", "2"],
    [ "完了"  , "3"]
  ]

  #attr_accessible :name, :memo, :tag_list, :list_id, :due, :task_status, :user_id

  def self.find_by_uid(uid)
    find(:all, :conditions => ["user_id = ?", uid])
  end

  def self.find_by_list_id(list_id)
    find(:all, :conditions => ["list_id = ?", list_id])
  end

end
