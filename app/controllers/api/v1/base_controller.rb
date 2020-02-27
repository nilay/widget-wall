class Api::V1::BaseController < ActionController::API
  respond_to :json
  before_action :doorkeeper_authorize!
end