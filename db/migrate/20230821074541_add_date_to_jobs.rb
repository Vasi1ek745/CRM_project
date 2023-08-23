class AddDateToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :date, :date
  end
end
