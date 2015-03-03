class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.text :notes
      t.datetime :date, null: false
      t.integer :duration_in_minutes, null: false, default: 0
      t.integer :task_id, null: false
      t.integer :project_id, null: false
      t.integer :employee_id, null: false

      t.timestamps null: false
    end
  end
end
