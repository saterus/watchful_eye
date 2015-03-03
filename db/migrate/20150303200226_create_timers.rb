class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.datetime :start_time, null: false, default: 'now()'
      t.datetime :end_time
      t.integer :time_entry_id, null: false

      t.timestamps null: false
    end
  end
end
