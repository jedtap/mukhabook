class Profile < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :likes

  has_many :comments, through: :posts
end
