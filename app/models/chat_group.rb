class ChatGroup < ApplicationRecord
  has_many :chat_group_users
  has_many :users, through: :chat_group_users
  has_many :messages

  accepts_nested_attributes_for :users, allow_destroy: true

  validates :team, presence: true
end
