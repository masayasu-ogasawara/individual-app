class Game < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images,allow_destroy: true
  has_many :comments
  belongs_to :user

  validates :images, presence: true
  validates :name,presence: true, length: {maximum: 40}
  validates :introduction,presence: true, length: {maximum: 1000}
end
