# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tournaments/new', type: :view do
  before(:each) do
    assign(:tournament, Tournament.new(
                          name: 'MyString',
                          alley: nil,
                          format: 'MyText',
                          participants: 'MyString',
                          flyer_url: 'MyString',
                          contact: nil
                        ))
  end

  it 'renders new tournament form' do
    render

    assert_select 'form[action=?][method=?]', tournaments_path, 'post' do
      assert_select 'input[name=?]', 'tournament[name]'

      assert_select 'input[name=?]', 'tournament[alley_id]'

      assert_select 'textarea[name=?]', 'tournament[format]'

      assert_select 'input[name=?]', 'tournament[participants]'

      assert_select 'input[name=?]', 'tournament[flyer_url]'

      assert_select 'input[name=?]', 'tournament[contact_id]'
    end
  end
end
