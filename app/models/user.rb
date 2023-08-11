class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :password, presence: true, format: {with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :read_last, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :read_first, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
