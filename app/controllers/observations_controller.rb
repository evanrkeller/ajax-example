class ObservationsController < ApplicationController

  require 'open-uri'
  require 'json'

  def index
    # use this API instead, just to be able to get a collection of objects returned.
    # http://api.espn.com/v1/sports/basketball/nba/news/headlines?limit=5&apikey=6j92weydgqdk4he9m6fvb7zm
    # 
    # Here's example output:
    # http://developer.espn.com/docs/headlines#sample-response
    #     JSON is way down on the page
    
    params[:q] = 'nba' if params[:q].blank?
    @observations =  JSON.parse(open("http://api.espn.com/v1/sports/basketball/#{URI::encode params[:q]}/news/headlines?limit=5&apikey=6j92weydgqdk4he9m6fvb7zm").read)
    # @observation =  JSON.parse(open("http://api.openweathermap.org/data/2.5/weather?q=#{URI::encode params[:q]}").read)
    respond_to do |format|
      format.html
      format.json { render json: @observations }
    end
  end

end


## ESPN API
## Key: 6j92weydgqdk4he9m6fvb7zm
## Application: Test 
## Key: 6j92weydgqdk4he9m6fvb7zm 
## Shared Secret: E2EfSavWbu3TRmPNZbmf7amB 
## Status: active 
## Registered: 31 seconds ago
## KEY RATE LIMITS
## 3	Calls per second
## 7,500	Calls per day

## See example output here:

## http://developer.espn.com/docs/headlines#sample-response

## XML is listed first, JSON is listed second
