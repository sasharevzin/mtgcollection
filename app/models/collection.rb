class Collection < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :cards
  
  # validates :user_id, presence: true
end
