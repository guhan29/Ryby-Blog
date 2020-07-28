class Comment < ApplicationRecord
  belongs_to :post

  validates :username, presence: true
  validates :body, presence: true
  # validates :comments, presence: true
end
