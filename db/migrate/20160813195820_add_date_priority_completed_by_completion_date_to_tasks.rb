class AddDatePriorityCompletedByCompletionDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :date_priority_assigned, :datetime
    add_column :tasks, :completed_by, :string
    add_column :tasks, :completion_date, :datetime
  end
end


