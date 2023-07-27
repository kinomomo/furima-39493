class OrderAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :pastal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :order

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :pastal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, inclusion: { in: Prefecture.pluck(:id) }
    validates :city
    validates :block
    validates :phone_number, format: {message: "is invalid. Include hyphen(-)"}
  end
    validates :building_name

    def save
      # 購入情報を保存し、変数orderに代入する
      order = Order.create(item: item, user_id: user_id)
      # 住所を保存する
      # order_idには、変数orderのidと指定する
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end