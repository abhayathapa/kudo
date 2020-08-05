require 'rails_helper'

RSpec.describe "stand_ups/edit", type: :view do
  before(:each) do
    @stand_up = assign(:stand_up, StandUp.create!())
  end

  it "renders the edit stand_up form" do
    render

    assert_select "form[action=?][method=?]", stand_up_path(@stand_up), "post" do
    end
  end
end
