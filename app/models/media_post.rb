class MediaPost < ApplicationRecord
  validates :date_public, presence: true

  enum genre: {
    tv: 0,
    newspaper: 1,
    magazine: 2,
    web: 3,
    youtube: 4,
    other: 5
  }
end
