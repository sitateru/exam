class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def render_ok(res = nil)
    render json: { status: 'ok', payload: res }
  end

  def render_ng(code, message)
    render json: { status: 'ng', error_code: code, message: message }
  end
end
