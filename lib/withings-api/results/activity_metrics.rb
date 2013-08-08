module Withings
  module Api
    class Client
      def get_activity_by date
        fetch( "/v2/measure?action=getactivity&userid=#{@withings_user_id}&date=#{date}" )
      end
    end
  end
end