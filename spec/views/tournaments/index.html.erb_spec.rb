# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tournaments/index', type: :view do
  before(:each) do
    assign(:tournaments, [
             Tournament.create!(
               name: 'Name',
               alley: nil,
               format: 'MyText',
               participants: 'Participants',
               flyer_url: 'Flyer Url',
               contact: nil
             ),
             Tournament.create!(
               name: 'Name',
               alley: nil,
               format: 'MyText',
               participants: 'Participants',
               flyer_url: 'Flyer Url',
               contact: nil
             )
           ])
  end

  it 'renders a list of tournaments' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Participants'.to_s, count: 2
    assert_select 'tr>td', text: 'Flyer Url'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
