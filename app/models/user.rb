class User < ApplicationRecord
  has_secure_password
	has_one :admin
	has_one :wait_list
	has_one :reset_password
	belongs_to :team, optional: true
  has_attached_file :avatar, default_url: "default_avatar.jpg"
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :first_name, :last_name, :email, presence: true
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
