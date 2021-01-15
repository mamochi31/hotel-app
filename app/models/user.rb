class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  PASSWORD_REGEX = /[a-z\d]{6,}/i
  validates :password, format: { with: PASSWORD_REGEX }
end
