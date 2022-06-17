class ApplicationController < ActionController::Base
  include JsonWebToken
  before_action :authenticate_request

  private

  def authenticate_request(credential)
    user = User.where(email: credential[0]).take
    return false unless user || user.confirmed?
    @current_user = user
  end
end
