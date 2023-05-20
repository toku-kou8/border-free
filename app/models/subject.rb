class Subject < ApplicationRecord
  enum grade: { elementary: 0, junior: 1, high: 2 }
  has_many :subject_teachers
  has_many :teachers, through: :subject_teachers

  def name_grade
    self.name + '(' + self.grade_i18n + ')'
  end
end
