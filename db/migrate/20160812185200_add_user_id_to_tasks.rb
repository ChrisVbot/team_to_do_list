
class AddUserIdToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :user, foreign_key: true
  end
end

