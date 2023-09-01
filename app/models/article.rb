class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3, maximum: 50, message: 'must be between 3 and 50 characters' }
    validates :description, presence: true, length: { minimum: 10, maximum: 1000, message: 'must be between 10 and 1000 characters' }
  end
  