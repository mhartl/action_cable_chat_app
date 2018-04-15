class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }

  def mentions
    names = content.scan(/@(#{User::NAME_REGEX})/).flatten
    users = User.where(username: names)
  end
end
