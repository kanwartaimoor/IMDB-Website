class Movie < ApplicationRecord
  has_and_belongs_to_many :actors, scope: [:id]
  has_many_attached :images
  validates :title, presence: true
  paginates_per 2
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :users
end