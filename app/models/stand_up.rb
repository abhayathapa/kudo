class StandUp < ApplicationRecord
  belongs_to :user

  self.per_page = 5

  validates_presence_of :name, :hours

  def date
    created_at.strftime('%A, %b %d')
  end

  # @return [Boolean]
  # Check if record is editable by current_user and current date
  def editable?(current_user)
    user == current_user && created_at.to_date == Date.today
  end
end