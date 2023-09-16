class User < ApplicationRecord
  has_secure_password  # Enables password hashing and authentication
  
  has_many :articles  # Defines a one-to-many association with articles

  # Validations for email and username
  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50, message: 'must be between 3 and 50 characters' }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50, message: 'must be between 3 and 50 characters' }

  validate :username_format  # Custom validation method for username format
  validate :password_format  # Custom validation method for password format

  before_save :downcase_email  # Callback to downcase email before saving

  def username_format
    errors.add(:username, 'cannot contain spaces') if username&.include?(' ')
  end

  def password_format
    if password.present?
      errors.add(:password, 'must contain at least one number') unless password.match(/\d/)
      errors.add(:password, 'cannot contain spaces') if password.include?(' ')
    end
  end

  private

  def downcase_email
    self.email = email.downcase  # Converts email to lowercase before saving
  end
end
