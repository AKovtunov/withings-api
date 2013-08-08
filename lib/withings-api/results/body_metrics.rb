module Withings
  module Api
    class Client
 
      def get_all_data
        fetch( "/measure?action=getmeas&userid=#{@withings_user_id}" )
      end
 
      def get_all_data_range( start_time, end_time )
        fetch( "/measure?action=getmeas&userid=#{@withings_user_id}&startdate=#{start_time}&enddate=#{end_time}" )
      end
 
      def get_blood_pressure_data
        fetch( "/measure?action=getmeas&userid=#{@withings_user_id}&devtype=4" )
      end
 
      def get_blood_pressure_data_updated_since( last_update )
        fetch( "/measure?action=getmeas&userid=#{@withings_user_id}&devtype=4&lastupdate=#{last_update.to_i}" )
      end
 
      def get_blood_pressure_data_range( start_time, end_time )
        fetch( "/measure?action=getmeas&userid=#{@withings_user_id}&devtype=4&startdate=#{start_time}&enddate=#{end_time}" )
      end
 
      def get_weight_data
        fetch( "/measure?action=getmeas&userid=#{@withings_user_id}&devtype=1" )
      end
 
      def get_weight_data_updated_since( last_update )
        fetch( "/measure?action=getmeas&userid=#{@withings_user_id}&devtype=1&lastupdate=#{last_update.to_i}" )
      end
 
      def get_weight_data_range( start_time, end_time )
        fetch( "/measure?action=getmeas&userid=#{@withings_user_id}&devtype=1&startdate=#{start_time}&enddate=#{end_time}" )
      end
 
      def old_subscribe_to_feeds
        results = []
        [BODY_SCALE, BLOOD_PRESSURE_MONITOR].each do |device|
          end_point = CGI.escape("https://#{configatron.hostname}/#{SUBHUB}/#{device}")
          comment = URI.encode("Subscribe to Withings data feed: #{device}")
          puts "Subscribing " +  "/notify?action=subscribe&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}&comment=#{comment}"
          results << fetch("/notify?action=subscribe&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}&comment=#{comment}")
        end
        results
      end
 
      def list_subscriptions
        fetch( "/notify?action=list&userid=#{@withings_user_id}" )
      end
 
      def old_get_subscriptions
        results = []
        [BODY_SCALE, BLOOD_PRESSURE_MONITOR].each do |device|
          end_point = CGI.escape("https://#{configatron.hostname}/#{SUBHUB}/#{device}")
          puts "https://#{configatron.hostname}/#{SUBHUB}/#{device}"
          results << fetch("/notify?action=get&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}")
        end
        results
      end
 
      def old_revoke_subscriptions
        results = []
        [BODY_SCALE, BLOOD_PRESSURE_MONITOR].each do |device|
          end_point = CGI.escape("https://#{configatron.hostname}/#{SUBHUB}/#{device}")
          puts "Revoking Subscription " + "/notify?action=revoke&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}"
          results << fetch("/notify?action=revoke&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}")
        end
        results
      end
 
      def subscribe_to_feeds
        results = []
        [BODY_SCALE].each do |device|
          end_point = CGI.escape("https://#{configatron.hostname}/#{SUBHUB}/#{device}")
          comment = URI.encode("Subscribe to Withings data feed: #{device}")
          puts "Subscribing " +  "/notify?action=subscribe&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}&comment=#{comment}"
          results << fetch("/notify?action=subscribe&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}&comment=#{comment}")
        end
        results
      end
 
      def get_subscriptions
        results = []
        [BODY_SCALE].each do |device|
          end_point = CGI.escape("https://#{configatron.hostname}/#{SUBHUB}/#{device}")
          puts "https://#{configatron.hostname}/#{SUBHUB}/#{device}"
          results << fetch("/notify?action=get&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}")
        end
        results
      end
 
      def revoke_subscriptions
        results = []
        [BODY_SCALE].each do |device|
          end_point = CGI.escape("https://#{configatron.hostname}/#{SUBHUB}/#{device}")
          puts "Revoking Subscription " + "/notify?action=revoke&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}"
          results << fetch("/notify?action=revoke&userid=#{@withings_user_id}&callbackurl=#{end_point}&appli=#{device}")
        end
        results
      end
 
    end
  end
end