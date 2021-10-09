# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSettingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/user_settings').to route_to('user_settings#index')
    end

    it 'routes to #new' do
      expect(get: '/user_settings/new').to route_to('user_settings#new')
    end

    it 'routes to #show' do
      expect(get: '/user_settings/1').to route_to('user_settings#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/user_settings/1/edit').to route_to('user_settings#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/user_settings').to route_to('user_settings#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/user_settings/1').to route_to('user_settings#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/user_settings/1').to route_to('user_settings#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/user_settings/1').to route_to('user_settings#destroy', id: '1')
    end
  end
end
