require 'spec_helper'
require 'json'
describe "Client" do
  let(:user){Withings::Api::Client.new(
    :consumer_key => "08943c64c3ccfe86d5edb40c8db6ddbbc43b6f58779c77d2b02454284db7ec",
  	:consumer_secret => "85949316f07fc41346be145fe8fbc18b73f954f280be958033571720510" , 
    :client_token => "57931694f77ee379839ce77f45c159b17483217feb3d4fc283b700127508b", 
    :client_secret => "1959f2d3255b6376b821e8155bb2ce987ff774183d0091d071edb9ec1ffff", 
    :uid => "992817"
    )}
  it "should get activity metrics by day" do
  	behaves_like_hash user.get_activity_by(1373310190)
  end
end