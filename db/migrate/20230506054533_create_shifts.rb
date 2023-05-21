class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.integer :teacher_id, null: false
      t.integer :status, nill: false, default: 0
      t.datetime :start_time, null: false
      t.integer :timetable, null: false
      t.timestamps
    end
  end
end
