class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :image 
    validates :product_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price,  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true}
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_date_id
  end
  
end
