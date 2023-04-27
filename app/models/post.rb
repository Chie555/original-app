class Post < ApplicationRecord
  validates :start_time, presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 200 }

  # アソシエーション
  belongs_to :user
  # has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :today_id, optional: true
end