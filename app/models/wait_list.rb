class WaitList < ApplicationRecord
  belongs_to :user, optional: true
end
