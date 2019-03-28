class Order < ApplicationRecord
    validates :restaurant_name, presence: true,
                    length: { minimum: 5 }
    validates :meal, presence: true
    validates :menu_image, presence: true
    has_many :order_details
    belongs_to :user
    acts_as_taggable_on :tags
    mount_uploader :menu_image, ImageUploader
end
