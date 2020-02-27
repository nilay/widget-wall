# frozen_string_literal: true

class Api::V1::Users::BaseController < ApplicationController
  before_action :set_user

  def set_user
    @user = User.find(params[:user_id])
  end

end