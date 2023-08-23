class RemoveDateTimeFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :date_time, :datetime
  end
end
