class Absent < ApplicationRecord
  belongs_to :user

  def self.notify
    User.all.find_each(batch_size: 50) do |user|
      Absent.create!(user: user) unless user.has_standup_today? 
    end
  end
end
