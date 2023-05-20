class Subject < ApplicationRecord
  enum grade: { elementary: 0, junior: 1, high: 2 }
end
