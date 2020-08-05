require 'rails_helper'

RSpec.describe "stand_ups/show", type: :view do
  before(:each) do
    @stand_up = assign(:stand_up, StandUp.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
