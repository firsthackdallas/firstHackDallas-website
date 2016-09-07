class User < ApplicationRecord
  has_secure_password
  has_attached_file :avatar
end
