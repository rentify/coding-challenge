require 'open-uri'
require 'json'

class Weather
  def initialize

  end

  def query(location)
    "Now in #{location} the weather is: " + openweather_situation(location)['weather'][0]['description']
  end

  private

  def openweather_situation(location)
    @situation ||= JSON.load(open("http://api.openweathermap.org/data/2.5/weather?q=#{location}"))
  end
end

