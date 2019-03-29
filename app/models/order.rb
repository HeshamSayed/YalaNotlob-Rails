class Order < ApplicationRecord
    validates :restaurant_name, presence: true,
                    length: { minimum: 3 }
    validates :meal, presence: true
    has_many :orders_users, dependent: :delete_all
  
    has_many :order_details
    belongs_to :user
    acts_as_taggable_on :tags
    mount_uploader :menu_image, ImageUploader
end
