class Cart < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :total_price, presence: true
    validates :product_ids, presence: true
end
