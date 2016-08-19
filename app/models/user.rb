class User < ApplicationRecord
  has_many :messages
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: { with: /\A\w+\z/i },
                       length: { maximum: 15 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
