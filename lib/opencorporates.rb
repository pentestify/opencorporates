# Working Python
=begin
import sys
import json
import requests

res = requests.get(API_URL + "/data", auth=(UID, SECRET))
if res.status_code != 200:
    print "error occurred: %s" % res.json()["error"]
    sys.exit(1)
for name, series in res.json()["raw_series"].iteritems():
    print series["name"], "was last updated at", series["latest_result"]["timestamp"]
=end

require_relative "opencorporates/version"
require 'rest-client'
require "json"

module Opencorporates
  class Api

    def initialize(api_key=nil, options={})
      @api_uri = "https://api.opencorporates.com/v0.4"
      @api_key = api_key

      # TODO - allow proxy configuration here...
    end

    def search(keyword,search_type="companies")
      # search_type should be one of: companies, officers, corporate_groupings,

      # "80.http.get.headers.server: Apache"
      #payload = {
      #  "q": keyword
      #}

      response = RestClient::Request.new(
        :method => :get,
        :url => "#{@api_uri}/#{search_type}/search",
        :headers => { :accept => :json,
                      :content_type => :json,
                      :params => { :q => keyword }
                    }
      ).execute

      results = JSON.parse(response.to_str)
    end

  end
end
