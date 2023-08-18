class DonationAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipality, :address, :building_name :phone_num, :user_id, :item_id

  belongs_to :prefecture

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :municipality
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
  end   ShippingAddress.crate(order_id: order_id, post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_num: phone_num)

end