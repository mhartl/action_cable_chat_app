class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]
  has_many :messages
  NAME_REGEX = /\w+/
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: { with: /\A#{NAME_REGEX}\z/i },
                       length: { maximum: 15 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
