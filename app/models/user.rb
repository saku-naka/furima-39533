class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items

  validates :nick_name, presence: true
  validates :password, format: {with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :read_last, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :read_first, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
