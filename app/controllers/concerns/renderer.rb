module Renderer
  extend ActiveSupport::Concern

  # Common method to render success response inside this module
  def render_success message: 'success', data: nil, code: 0
    render json: { code: code, message: message, data: data }, status: 200
  end

  # Common method to render error response inside this module
  def render_error message: I18n.t('errors.e_400'),  data: nil, code: 1
    render json: { code: code, message: message, data: data}, status: 400
  end


end
