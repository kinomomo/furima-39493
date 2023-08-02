class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A(0\d{1,4}-\d{1,4}-\d{4}|0\d{9,10})\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
  end

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id:, user_id:)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code:, prefecture_id:, city:, block:,
                   building_name:, phone_number:, order_id: order.id)
  end
end
