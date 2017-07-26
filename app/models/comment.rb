class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user, optional: true
  delegate :username, to: :user, allow_nil: true
  validates :body, presence: true
end
