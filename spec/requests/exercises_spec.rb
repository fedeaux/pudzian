require 'rails_helper'

RSpec.describe "Exercises", type: :request do
  describe "GET /exercises" do
    it 'returns an error to unathorized users' do
      get exercises_path
      expect(JSON.parse(response.body)).to have_key 'errors'
    end

    it 'returns a list of exercises to authorized users' do
      set_request_headers_for :user_ray
      get exercises_path, headers: @request_headers
      expect(JSON.parse(response.body)).to have_key 'exercises'
    end
  end
end
