class OrderAddress 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_num


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :municipality
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{11}\z/}
  end

  def save
      order = Order.create(user_id: user_id, item_id: item_id)
      shipping_address = ShippingAddress.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_num: phone_num)
  end
end