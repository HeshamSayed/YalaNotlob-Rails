class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :groups
  has_many :users, class_name: "Friend", foreign_key: "user_id"
  has_many :order
  has_many :friend

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.image = auth.info.image
    user.username = auth.info.username
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.password = Devise.friendly_token[0,20]

  end
  end
end  