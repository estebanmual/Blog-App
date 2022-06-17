class ApplicationController < ActionController::Base
  include JsonWebToken
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    if header
      header = header.split.last
      decoded = jwt_decode(header)
      if decoded == 'Token not found'
        render json: { error: 'Not authenticated' }, status: :unauthorized
      else
        @current_user = User.find(decoded[:user_id])
      end
    end
  end
end
