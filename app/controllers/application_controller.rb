class ApplicationController < ActionController::Base
  before_action :authenticate!
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception

  def authenticate!
    authenticate_user! unless params['controller'] == 'devise_token_auth/sessions'
  end
end
