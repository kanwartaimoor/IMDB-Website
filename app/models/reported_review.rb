class ReportedReview < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :review, dependent: :destroy
end
