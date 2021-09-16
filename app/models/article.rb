class Article < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  belongs_to :user
end
