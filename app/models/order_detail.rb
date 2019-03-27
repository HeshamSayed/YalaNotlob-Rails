class OrderDetail < ApplicationRecord
    validates :item, presence: true,
        length: {minimum: 5}
    belongs_to :order
end
