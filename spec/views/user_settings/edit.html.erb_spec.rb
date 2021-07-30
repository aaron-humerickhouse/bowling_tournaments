require 'rails_helper'

RSpec.describe "user_settings/edit", type: :view do
  before(:each) do
    @user_setting = assign(:user_setting, UserSetting.create!(
      user: nil,
      notification_search_radius: 1
    ))
  end

  it "renders the edit user_setting form" do
    render

    assert_select "form[action=?][method=?]", user_setting_path(@user_setting), "post" do

      assert_select "input[name=?]", "user_setting[user_id]"

      assert_select "input[name=?]", "user_setting[notification_search_radius]"
    end
  end
end
