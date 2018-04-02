class User < ApplicationRecord

 belongs_to :customer

 # showing relationship to articles wher user is the parent

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password # this hashes the password when saving using bcrypt GEM - needs to be part of bundle


end
