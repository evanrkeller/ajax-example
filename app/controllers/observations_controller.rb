class ObservationsController < ApplicationController

  require 'open-uri'
  require 'json'

  def index
    @observation =  JSON.parse(open("http://api.openweathermap.org/data/2.5/weather?q=Birmingham,%20AL").read)
    respond_to do |format|
      format.html
      format.json { render json: @observation }
    end
  end

end
