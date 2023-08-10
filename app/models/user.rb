class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :read_first, presence: true
  validates :read_last, presence: true
  validates :birthday, presence: true
end
