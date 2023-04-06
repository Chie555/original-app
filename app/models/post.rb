class Post < ApplicationRecord
  validates :weight, presence: true, numericality: true
  validates :fat_percentage, numericality: true
  validates :today1_id, numericality: { other_than: 0, message: 'を選択してください' }
  validates :today2_id, numericality: { other_than: 0, message: 'を選択してください' }
  validates :today3_id, numericality: { other_than: 0, message: 'を選択してください' }
  validates :image, presence: true
  # アソシエーション
  belongs_to :user
  # has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :today1_id
  belongs_to :today2_id
  belongs_to :today3_id
end
