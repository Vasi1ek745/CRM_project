class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.datetime :date_time
      t.integer :cost
      t.string :comments
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
