require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:current_user) { create :user_ray }
  let(:right_password) { attributes_for(:user_ray)[:password] }
  let(:wrong_password) { 'anything-but-a-password' }

  describe "POST /auth/sign_in" do
    it "retuns an auth token if the right credentials were given" do
      post user_session_path, params: { email: current_user.email, password: right_password }
      expect(response).to have_http_status(200)
      expect(response.headers).to have_key "access-token"
    end
  end
end
