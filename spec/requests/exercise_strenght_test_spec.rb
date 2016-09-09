require 'rails_helper'

RSpec.describe "ExerciseStrenghtTest", type: :request do
  describe "GET exercise_strenght_test?exercise_id=\d" do
    let(:exercise) { create_or_find_exercise(:exercise_benchpress) }
    let(:exercise_strenght_test) { create(:exercise_strenght_test) }

    before :each do
      set_request_headers_for :user_ray
    end

    it 'returns the related exercise_strenght_test' do
      get exercise_strenght_tests_path(exercise_id: exercise_strenght_test.exercise.id), headers: @request_headers
      json_response = JSON.parse response.body

      expect(json_response).to have_key 'exercise_strenght_test'
      expect(json_response['exercise_strenght_test']['mr_weights'].values).to eq exercise_strenght_test.mr_weights.values
    end

    it 'returns a blank response if the is no ExerciseStrenghtTest for the exercise' do
      get exercise_strenght_tests_path(exercise_id: exercise.id), headers: @request_headers
      expect(response.body).to be_empty
    end
  end
end
