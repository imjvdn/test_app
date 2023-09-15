class User < ApplicationRecord
  has_secure_password
  has_many :articles

  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50, message: 'must be between 3 and 50 characters' }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50, message: 'must be between 3 and 50 characters' }

  validate :username_format
  validate :password_format

  def username_format
    errors.add(:username, 'cannot contain spaces') if username&.include?(' ')
  end

  def password_format
    if password.present?
      errors.add(:password, 'must contain at least one number') unless password.match(/\d/)
      errors.add(:password, 'cannot contain spaces') if password.include?(' ')
    end
  end
end
