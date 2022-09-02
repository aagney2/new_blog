class Blog < ApplicationRecord
  paginates_per 10
  has_many :comments, dependent: :destroy # assocations
  validates :title, :author_name, :description, presence: true # validations

  # callbacks
  after_commit :send_email
  after_destroy :log_destroy_action
  after_find do |blog|
    puts "--You have found an object!--"
  end

  private
  def send_email
    puts 'sending email'
  end

  def log_destroy_action
    puts 'Article destroyed'
  end
end
