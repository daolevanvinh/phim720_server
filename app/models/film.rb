class Film < ApplicationRecord
  has_many :seasons
  has_many :comments
  has_and_belongs_to_many :genres
end
