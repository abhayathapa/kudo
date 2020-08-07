class CsvGenerator
  def initialize(records, attributes)
    @records = records
    @attributes = attributes
  end
  
  def to_csv
    CSV.generate(headers: true) do |csv|
      csv << @attributes
      @records.find_each(batch_size: 50) do |record|
        csv << @attributes.map{ |attr| record.send(attr) }
      end
    end
  end

  def call
    self.to_csv if @records.present? && @attributes.present?
  end

  private

  attr_reader :records, :attributes
end
