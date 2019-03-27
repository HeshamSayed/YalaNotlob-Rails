class Order < ApplicationRecord
    validates :restaurant_name, presence: true
    has_many :order_details
    has_many :orders_users, dependent: :delete_all
    
    belongs_to :user
  
    mount_uploader :menu_image, ImageUploader
end
