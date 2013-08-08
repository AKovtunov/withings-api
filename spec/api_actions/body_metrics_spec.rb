require 'spec_helper'
require 'json'
def behaves_like_hash response
    expect(response).not_to be_nil
    expect(response).to be_kind_of (Hash)
end
describe "Client" do
  let(:user){Withings::Api::Client.new(
    :consumer_key => "08943c64c3ccfe86d5edb40c8db6ddbbc43b6f58779c77d2b02454284db7ec",
  	:consumer_secret => "85949316f07fc41346be145fe8fbc18b73f954f280be958033571720510" , 
    :client_token => "57931694f77ee379839ce77f45c159b17483217feb3d4fc283b700127508b", 
    :client_secret => "1959f2d3255b6376b821e8155bb2ce987ff774183d0091d071edb9ec1ffff", 
    :uid => "992817"
    )}
  it "should have access to all data" do
    behaves_like_hash user.get_all_data
  end
  it "should have access to all data by range" do
    behaves_like_hash user.get_all_data_range(1373310190, 1350519900)
  end
  it "should have access to blood_pressure_data" do
    behaves_like_hash user.get_blood_pressure_data
  end
  it "should get blood pressure data updated since period" do
    behaves_like_hash user.get_blood_pressure_data_updated_since(1350519900)
  end
  it "should get blood pressure data from start_time to end_time" do
    behaves_like_hash user.get_blood_pressure_data_range(1373310190, 1350519900)
  end
  it "should get weight data" do
    behaves_like_hash user.get_weight_data  
  end
  it "should get weight data updated since some time" do
    behaves_like_hash user.get_weight_data_updated_since(1350519900)
  end
  it "should get weight data from start time to end time" do
    behaves_like_hash user.get_weight_data_range(1373310190, 1350519900)
  end
  xit "should old_subscribe_to_feeds" do
    behaves_like_hash user.old_subscribe_to_feeds
  end
  it "should get list_subscriptions" do
    behaves_like_hash user.list_subscriptions
  end
  xit "should old_get_subscriptions" do
    behaves_like_hash user.old_get_subscriptions
  end
  xit "should old revoke subscriptions" do
    behaves_like_hash user.old_revoke_subscriptions
  end
  xit "should subscribe to feeds" do
    behaves_like_hash user.subscribe_to_feeds
  end
  xit "should get subscriptions" do
    behaves_like_hash user.get_subscriptions
  end
  xit "should revoke subscriptions" do
    behaves_like_hash user.revoke_subscriptions
  end
end