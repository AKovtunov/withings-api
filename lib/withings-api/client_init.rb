module Withings
  module Api
 
    module Constants
      WEIGHT = 1
      HEIGHT = 4
      FAT_FREE_MASS = 5
      FAT_RATIO = 6
      FAT_MASS = 8
      DIASTOLIC_BLOOD_PRESSURE = 9
      SYSTOLIC_BLOOD_PRESSURE = 10
      HEART_PULSE = 11
      BODY_SCALE = 1
      BLOOD_PRESSURE_MONITOR = 4
 
      SUBHUB = 'v2/withings/subhub'
    end
 
    class Client
      include OAuthBase, Withings::Api::Constants
 
      @client_token     = nil
      @client_secret    = nil
      @consumer_key     = nil
      @consumer_secret  = nil
      @withings_user_id = nil
 
      @consumer_token   = nil
      @access_token     = nil
 
      def initialize( arguments )
        ommitted_parameters = [:consumer_key, :consumer_secret, :client_token, :client_secret, :uid] - arguments.keys
        if ommitted_parameters.size > 0
          raise "You must supply the required options: #{ommitted_parameters.join(',')}"
        end
 
        @client_token = arguments[:client_token]
        @client_secret = arguments[:client_secret]
        @consumer_key = arguments[:consumer_key]
        @consumer_secret = arguments[:consumer_secret]
        @withings_user_id = arguments[:uid]
      end
 
      def fetch(path, params = {})
        #puts path
        response = api_http_request!( consumer_token, access_token, path, params )
        JSON.parse( response.body )
        #0	Operation was successfull
        #2555	An unknown error occured
        #247	The userid is either absent or incorrect
        #250	The provided userid and/or Oauth credentials do not match.
        #293	The callback URL is either absent or incorrect
        #304	The comment is either absent or incorrect
        #305	Too many notifications are already set
      end
 
      def consumer_token
        @consumer_token ||= ConsumerToken.new( @consumer_key, @consumer_secret )
      end
 
      def access_token
        @access_token ||= AccessToken.new( @client_token, @client_secret )
      end
 
    end
  end
end