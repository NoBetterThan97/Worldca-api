# frozen_string_literal: true
require_relative '../spec_helper'

describe 'root route' do
  before do
    VCR.insert_cassette(cassette_name(__FILE__, name), record: :new_episodes)
  end

  after do
    VCR.eject_cassette
  end

  describe 'get root route' do
    before(:each) do
      get '/'
    end

    it 'returns success' do
      last_response.status.must_equal 200
    end

    it 'returns a json' do
      last_response.content_type.must_equal 'application/json'
    end

    it 'returns a json with proper format' do
      data = JSON.parse(last_response.body)
      [data.dig('status'), data.dig('message')].compact.size.must_equal 2
    end
  end
end
