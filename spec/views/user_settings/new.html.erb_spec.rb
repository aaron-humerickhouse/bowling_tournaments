# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_settings/new', type: :view do
  before(:each) do
    assign(:user_setting, UserSetting.new(
                            user: nil,
                            notification_search_radius: 1
                          ))
  end

  it 'renders new user_setting form' do
    render

    assert_select 'form[action=?][method=?]', user_settings_path, 'post' do
      assert_select 'input[name=?]', 'user_setting[user_id]'

      assert_select 'input[name=?]', 'user_setting[notification_search_radius]'
    end
  end
end
