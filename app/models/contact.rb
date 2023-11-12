class Contact < ApplicationRecord
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
