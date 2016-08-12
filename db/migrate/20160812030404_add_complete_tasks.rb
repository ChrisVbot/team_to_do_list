class AddCompleteTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :complete, :boolean
    add_column :tasks, :priority, :boolean
  end
end
