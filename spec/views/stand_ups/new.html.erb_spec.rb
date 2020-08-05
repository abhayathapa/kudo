require 'rails_helper'

RSpec.describe "stand_ups/new", type: :view do
  before(:each) do
    assign(:stand_up, StandUp.new())
  end

  it "renders new stand_up form" do
    render

    assert_select "form[action=?][method=?]", stand_ups_path, "post" do
    end
  end
end
