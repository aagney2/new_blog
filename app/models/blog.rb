class Blog < ApplicationRecord
  validates :title, :author_name, :description, presence:true
  has_many :comments
end
