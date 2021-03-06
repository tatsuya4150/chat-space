class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #association
  has_many :chat_group_users
  has_many :chat_groups, through: :chat_group_users
  has_many :messages

  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 6 }
end
