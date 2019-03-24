class Order < ApplicationRecord
    has_many :order_details

    mount_uploader :menu_image, ImageUploader
end
