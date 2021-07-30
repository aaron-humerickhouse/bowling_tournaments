require 'rails_helper'

RSpec.describe "tournaments/show", type: :view do
  before(:each) do
    @tournament = assign(:tournament, Tournament.create!(
      name: "Name",
      alley: nil,
      format: "MyText",
      participants: "Participants",
      flyer_url: "Flyer Url",
      contact: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Participants/)
    expect(rendered).to match(/Flyer Url/)
    expect(rendered).to match(//)
  end
end
