class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :comment
end
