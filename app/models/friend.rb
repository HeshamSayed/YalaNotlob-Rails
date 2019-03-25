class Friend < ApplicationRecord
    belongs_to :user , class_name: "User", foreign_key: "friend_id"
end
