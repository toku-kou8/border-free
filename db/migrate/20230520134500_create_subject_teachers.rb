class CreateSubjectTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_teachers do |t|
      t.integer :teacher_id, null: false
      t.integer :subject_id, null: false
      t.timestamps
    end
  end
end
