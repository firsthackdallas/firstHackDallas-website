class Sponsor < ApplicationRecord
  validates :first_name, :last_name, :email, :sponsor_type, presence: true
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
