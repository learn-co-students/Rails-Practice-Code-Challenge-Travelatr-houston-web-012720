class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: false, on: :special_context
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 31, 
            :message => "Bio must be longer than 30 characters"}
            # ERROR: Message not outputing 
end
