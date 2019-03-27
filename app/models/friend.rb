class Friend < ApplicationRecord
    # validates :friend, uniqueness: { scope: [:user_id, :friend_id] }


    belongs_to :user , class_name: "User", foreign_key: "friend_id"
end
