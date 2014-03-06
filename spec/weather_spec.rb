require_relative '../lib/weather'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

describe Weather do
  context 'when asked for the weather in a city' do
    let(:weather) { Weather.new }

    it 'returns a string including the location' do
      VCR.use_cassette(:weather) do
        expect(weather.query('London')).to include('London')
      end
    end

    it 'returns the current weather' do
      VCR.use_cassette(:weather) do
        expect(weather.query('London')).to include('clouds')
      end
    end
  end
end

