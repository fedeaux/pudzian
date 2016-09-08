require 'rails_helper'

RSpec.describe "Exercises", type: :request do
  describe "GET /exercises" do
    it 'returns an error to unathorized users' do
      get exercises_path
      expect(JSON.parse(response.body)).to have_key 'errors'
    end

    context 'Authorized users' do
      before :each do
        set_request_headers_for :user_ray
      end

      it 'returns a list of exercises' do
        get exercises_path, headers: @request_headers
        expect(JSON.parse(response.body)).to have_key 'exercises'
      end

      it 'includes a list of all categories present on some exercise' do
        exercise = create :exercise_benchpress, :with_categories
        get exercises_path, headers: @request_headers
        json_response = JSON.parse response.body

        response_categories_names = json_response['categories'].map{ |category|
          category['name']
        }.sort

        expect(response_categories_names).to eq exercise.categories.map(&:name).sort
      end

      it 'includes an empty list of categories if no exercise exists' do
        exercise = create :exercise_benchpress
        get exercises_path, headers: @request_headers
        expect(JSON.parse(response.body)['categories']).to be_empty
      end
    end
  end

  describe "GET exercises/:id" do
    let(:exercise) { create(:exercise_benchpress) }
    let(:exercise_with_categories) { create(:exercise_squat, :with_categories) }

    before :each do
      set_request_headers_for :user_ray
    end

    it 'returns an exercise to authorized users' do
      get exercise_path(exercise.id), headers: @request_headers
      json_response = JSON.parse response.body

      expect(json_response).to have_key 'exercise'
      expect(json_response['exercise']['name']).to eq exercise.name
    end

    it 'includes exercise categories' do
      get exercise_path(exercise_with_categories.id), headers: @request_headers
      json_response = JSON.parse response.body

      expect(json_response['exercise']['categories'].count).to eq exercise_with_categories.categories.count
      expect(json_response['exercise']['categories'][0]['name']).to eq exercise_with_categories.categories.first.name
    end
  end
end
