class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :posts, through: :profile

  has_many :friendships
  has_one :google_account

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.name = auth.info.first_name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
