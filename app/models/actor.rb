class Actor < ApplicationRecord
  has_and_belongs_to_many :movies
  has_one_attached :avatar
end
