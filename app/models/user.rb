class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :books, dependent: :destroy


  validates :name, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  



         def get_image(width,height)
           unless image.attached?
           file_path = Rails.root.join('app/assets/images/default-image.jpg')
           image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
           end
           image.variant(resize_to_limit: [width, height]).processed
         end
  end

