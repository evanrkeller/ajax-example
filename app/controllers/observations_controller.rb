class ObservationsController < ApplicationController

  require 'open-uri'
  require 'json'

  def index
    params[:q] = 'Birmingham, AL' if params[:q].blank?
    @observation =  JSON.parse(open("http://api.openweathermap.org/data/2.5/weather?q=#{URI::encode params[:q]}").read)
    respond_to do |format|
      format.html
      format.json { render json: @observation }
    end
  end

end
