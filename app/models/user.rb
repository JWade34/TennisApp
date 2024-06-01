class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :matches, dependent: :destroy
  has_many :sent_invites, class_name: 'MatchInvite', foreign_key: 'sender_id'
  has_many :received_invites, class_name: 'MatchInvite', foreign_key: 'recipient_id'
  validates :first_name, :last_name, presence: true

  # Example method to get full name
  def full_name
    "#{first_name} #{last_name}"
  end

end
