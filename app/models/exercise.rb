class Exercise < ApplicationRecord
  belongs_to :user, optional: true
end
