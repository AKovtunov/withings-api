require "withings-api/version"

require "withings-api/consts"
require "withings-api/query_string"
require "withings-api/utils"
require "withings-api/types"
require "withings-api/tokens"
require "withings-api/errors"
require "withings-api/oauth_base"
require "withings-api/oauth_actions"
require "withings-api/api_response"
require "withings-api/api_actions"
require "withings-api/client_init"
require "withings-api/results/body_metrics"
require "withings-api/results/activity_metrics.rb"

module Withings
  module Api
    extend OAuthActions
    extend ApiActions
  end
end
