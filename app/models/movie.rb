class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
	has_many_attached :images
end
