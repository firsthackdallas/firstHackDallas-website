class Team < ApplicationRecord
	has_attached_file :avatar, default_url: "default_team_avatar.png"
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :name, presence: true
	has_many :users
	belongs_to :event
end
