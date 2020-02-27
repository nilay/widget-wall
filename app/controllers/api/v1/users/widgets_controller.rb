# frozen_string_literal: true

class Api::V1::Users::WidgetsController < Api::V1::Users::BaseController


  def index
    widgets = params[:term].present? ? @user.widgets.search(params[:term]) : @user.widgets.list
    renderer widgets
  end

  def me
    widgets = params[:term].present? ? current_user.widgets.search(params[:term]) : current_user.widgets.list
    renderer widgets
  end


  private
  def renderer data
    render_success data: {
        widgets: data.as_api_response(:base)
    }
  end

end