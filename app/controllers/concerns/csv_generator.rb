class CsvGenerator

  # @param records{Object} 
  # @param attributes{Array} 
  def initialize(records, attributes)
    @records = records
    @attributes = attributes
    @success = false
  end
  
  def to_csv
    CSV.generate(headers: true) do |csv|
      csv << @attributes
      @records.find_each(batch_size: 50) do |object|
        csv << @attributes.map{ |attr| object.send(attr) }
      end
    end
  end

  # @return [String] 
  # Returns string with attributes as header and rows containing records
  def call
    if @records.present? && @attributes.present?
      @success = true
      self.to_csv
    end
  end

  def success?
    success
  end

  private

  attr_reader :success, :records, :attributes
end
