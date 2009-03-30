class Task < ActiveRecord::Base

  def self.find_tasks
    find(:all)
  end
end
