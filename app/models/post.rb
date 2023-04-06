class Post < ApplicationRecord
  validates :weight, presence: true, numericality: true, { greater_than_or_equal_to: 30.0, less_than_or_equal_to: 300.0, message: 'は半角数値の30.0kg〜300.0kgの範囲内で入力してください' }
  validates :fat_percentage, numericality: true, { greater_than_or_equal_to: 3.0, less_than_or_equal_to: 99.9, message: 'は半角数値の3.0%〜99.9%の範囲内で入力してください' }
  validates :today1_id, presence: {if: '!today1_memo.blank?' }, numericality: { other_than: 0, message: 'を選択してください' }
  validates :today2_id, presence: {if: '!today2_memo.blank?' }, numericality: { other_than: 0, message: 'を選択してください' }
  validates :today3_id, presence: {if: '!today3_memo.blank?' }, numericality: { other_than: 0, message: 'を選択してください' }
  validates :image, presence: true
  # アソシエーション
  belongs_to :user
  # has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :today1_id
  belongs_to :today2_id
  belongs_to :today3_id
end
