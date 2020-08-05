require 'rails_helper'

RSpec.describe "stand_ups/index", type: :view do
  before(:each) do
    assign(:stand_ups, [
      StandUp.create!(),
      StandUp.create!()
    ])
  end

  it "renders a list of stand_ups" do
    render
  end
end
