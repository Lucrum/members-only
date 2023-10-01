class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :username, presence: true
  validates :username, length: { in: 5..20 }
  validates :username, uniqueness: true

  validates :email, presence: true
  validates :email, length: { minimum: 6 }
end
