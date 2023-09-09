class Shift < ApplicationRecord
  belongs_to :teacher
  has_one :lesson
  def timetables(time)
    ans = time + 1

    if ans > 4
      ans -= 4
    end

    return ans
  end
end

