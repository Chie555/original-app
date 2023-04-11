class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  # 半角英数字混合
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }
  # 生年月日
  validates :birthday, presence: true
  # アソシエーション
  has_many :posts
  # has_many :follows
  # has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex_id
  belongs_to :prefecture_id
end
