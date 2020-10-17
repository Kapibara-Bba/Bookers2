class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 20}
  validates :introduction, length: {maximum: 50}


  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end
end
