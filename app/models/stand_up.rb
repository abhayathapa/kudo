class StandUp < ApplicationRecord
  belongs_to :user

  self.per_page = 5

  def self.to_csv(records)
    attributes = %w{id name hours info user}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      records.find_each do |stand_up|
        csv << attributes.map{ |attr| stand_up.send(attr) }
      end
    end
  end

end