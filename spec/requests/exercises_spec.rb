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

  describe "GET exercises/:id" do
    let(:exercise) { create(:exercise_benchpress) }
    let(:exercise_with_categories) { create(:exercise_squat, :with_categories) }

    it 'returns an exercise to authorized users' do
      set_request_headers_for :user_ray
      get exercise_path(exercise.id), headers: @request_headers
      json_response = JSON.parse response.body

      expect(json_response).to have_key 'exercise'
      expect(json_response['exercise']['name']).to eq exercise.name
    end

    it 'includes exercise categories' do
      set_request_headers_for :user_ray
      get exercise_path(exercise_with_categories.id), headers: @request_headers
      json_response = JSON.parse response.body

      expect(json_response['exercise']['categories'].count).to eq exercise_with_categories.categories.count
      expect(json_response['exercise']['categories'][0]['name']).to eq exercise_with_categories.categories.first.name
    end
  end
end
