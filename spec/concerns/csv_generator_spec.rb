require 'rails_helper'

RSpec.describe CsvGenerator, type: :concerns do
  describe "#call" do
    subject { described_class }

    context 'records and attributes is not provided' do
      it 'should not inactive the assignment' do
        service = subject.new(nil, nil)
        service.call
        expect(service.success?).to be_falsey
      end
    end

    context 'records and attributes is provided' do
      before do
        5.times do 
          create(:stand_up)
        end
      end
      it 'should not have any active the assignment' do
        attributes = %w{id name hours user date info}
        records = StandUp.all
        service = subject.new(records, attributes)
        service.call
        expect(service.success?).to be_truthy
      end
    end
  end
end
