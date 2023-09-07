class ChangeColumnDurationToJobs < ActiveRecord::Migration[7.0]
  def change
    change_column :jobs, :duration, :float
  end
end
