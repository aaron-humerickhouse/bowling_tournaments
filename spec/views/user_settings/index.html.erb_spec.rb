# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user_settings/index', type: :view do
  before(:each) do
    assign(:user_settings, [
             UserSetting.create!(
               user: nil,
               notification_search_radius: 2
             ),
             UserSetting.create!(
               user: nil,
               notification_search_radius: 2
             )
           ])
  end

  it 'renders a list of user_settings' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
