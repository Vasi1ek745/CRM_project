class AddPlaceToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :place, :string
  end
end
