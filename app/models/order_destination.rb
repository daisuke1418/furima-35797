class OrderDestination
  include ActiveModel::Model
  attr_accesoor :postal_code, :prefecture, :municipalities, :house_number, :building_name, :telephone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id, :item_id, :municipalities, :house_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A[0-9]{10, 11}\z/, message: "is invalid. Input only number"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    destionation.create(postal_code: postal_code, prefecture: prefecture, municipalites: municipalities, house_number: house_number, building_name: building_name, order_id: order.id)
  end
end