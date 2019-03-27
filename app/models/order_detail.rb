class OrderDetail < ApplicationRecord
    validates :item, presence: true,
        length: {minimum: 3}
    belongs_to :order
end
