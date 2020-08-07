require 'rails_helper'

RSpec.describe StandUp, type: :model do
  subject { create(:stand_up) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without hours" do
      subject.hours = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) }
  end
end
