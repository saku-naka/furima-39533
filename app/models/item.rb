class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1}
  validates :condition_id, presence: true,numericality: { other_than: 1}
  validates :postage_id, presence: true,numericality: { other_than: 1}
  validates :prefecture_id, presence: true,numericality: { other_than: 1}
  validates :shipping_date_id, presence: true,numericality: { other_than: 1}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  validates :image , presence: true
end
