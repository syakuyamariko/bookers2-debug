class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books #アソシエーション
  has_many :favorites, dependent: :destroy #UserモデルとFavoritesモデルを関連付ける
  has_many :book_comments, dependent: :destroy #UserモデルとBookCommentモデルを関連付ける
  has_one_attached :profile_image


  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 } #追加した


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
