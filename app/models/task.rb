class Task < ActiveRecord::Base
  has_many :user
  
  def self.find_tasks(uid)
    find(:all, :conditions => ["user_id = ?", uid])
  end
end
