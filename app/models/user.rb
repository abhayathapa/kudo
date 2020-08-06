class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stand_ups, class_name: "StandUp", foreign_key: "user_id"

  def to_s
    "#{first_name} #{last_name}"
  end

  def has_standup_today?
    stand_ups.where(created_at: Date.today.all_day).present?
  end
end
