class OrderDetail < ApplicationRecord
    validates :item, presence: true,
        length: {minimum: 3}
    validates_inclusion_of :amount, :in => 1..100
    validates_inclusion_of :price, :in => 1..100
    belongs_to :order
end
