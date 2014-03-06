require 'open-uri'
require 'json'

class Weather
  def initialize
  end

  def query(location = '')
    current_situation = current_situation(location)
    if current_situation['cod'] == '404'
      'Sorry, no location found for you'
    else
      "Now in #{location} the weather is: " +
        current_situation['weather'][0]['description']
    end
  end

  private

  def current_situation(location)
    @situation ||= JSON.load(open(URI.encode("http://api.openweathermap.org/data/2.5/weather?q=#{location}")))
  end
end

