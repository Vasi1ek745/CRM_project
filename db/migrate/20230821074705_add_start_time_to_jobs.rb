class AddStartTimeToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :start_time, :time
  end
end
