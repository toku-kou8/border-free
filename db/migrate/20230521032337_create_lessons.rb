class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.integer :teacher_id, null: false
      t.integer :student_id, null: false
      t.integer :subject_id, null: false
      t.integer :shift_id, nill: false
      t.integer :status, null: false, default: 0
      t.text :student_comment
      t.text :teacher_comment
      t.integer :star
      t.datetime :start_time, null: false
      t.integer :timetable, null: false
      t.timestamps
    end
  end
end
