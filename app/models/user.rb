class User < ApplicationRecord
  attr_accessor :password, :password_confirmation

  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: { with: /\A\w+\z/i},
                       length: { maximum: 15 }

  validates :password, presence: true, length: { minimum: 6 }
end
