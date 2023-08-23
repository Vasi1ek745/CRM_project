class ChangeDurationJobs < ActiveRecord::Migration[7.0]
  def change
    change_column :jobs, :duration, :integer
  end
end
