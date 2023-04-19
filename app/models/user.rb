class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  # password半角英数字混合
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }

  # 性別、居住地
  validates :sex_id, numericality: { other_than: 1, message: 'を選択してください' }

  # 身長体重目標体重
  validates :weight, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 200 }
  validates :height, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 200 }
  validates :target_weight, numericality: { greater_than_or_equal_to: 30, less_than_or_equal_to: 200 }

  # アソシエーション
  has_many :posts
  # has_many :follows
  # has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex_id
  belongs_to :prefecture_id
end
