# Write your code here
require 'net/http'
require 'open-uri'
require 'json'
require 'pry'
class GetRequester

    attr_reader :url

    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body  
    end

    def parse_json
        # we use the JSON library to parse the API response into nicely formatted JSON
          req_arr = []
          requesters = JSON.parse(self.get_response_body)
          requesters.collect do |request|
            req_arr << request
          end
          req_arr
    end

end

requesters = GetRequester.new("https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json")
puts requesters.parse_json