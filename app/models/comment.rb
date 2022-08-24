class Comment < ApplicationRecord
  belongs_to :blog
  validates :description, presence: true

  def comment_updated
    "Hello"
  end
end
