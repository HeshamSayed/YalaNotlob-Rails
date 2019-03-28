class Group < ApplicationRecord
    validates :name, presence: true , uniqueness: {scope: :user_id}
    belongs_to :user
  
    has_and_belongs_to_many :members ,    :through => :groupusers ,dependent: :delete_all
end
