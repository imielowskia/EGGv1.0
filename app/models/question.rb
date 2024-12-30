class Question < ApplicationRecord
  has_rich_text :tekst
  has_many :egzams
  has_many :users, through: :egzams


end
