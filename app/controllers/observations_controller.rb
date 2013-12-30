class ObservationsController < ApplicationController

  require 'open-uri'
  require 'json'

  def index
    render json: JSON.parse(open("http://api.openweathermap.org/data/2.5/weather?q=Birmingham,%20AL").read)
  end

end
