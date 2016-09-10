require 'rails_helper'

RSpec.describe "StrenghtBasedProgression", type: :request do
  describe "GET strenght_based_progressions?exercise_id=\d" do
    let(:exercise) { create_or_find_exercise(:exercise_benchpress) }

    before :each do
      set_request_headers_for :user_ray
    end

    it 'returns an empty object response if the is no strenght based progressions for the given exercise
        and a flag containing whether or not the exercise has a strenght test' do
      get strenght_based_progressions_path(exercise_id: exercise.id), headers: @request_headers
      json_response = JSON.parse response.body
      expect(json_response['strenght_based_progressions']).to eq []
      expect(json_response['exercise_has_strenght_test']).to eq false
    end

    it 'returns the strenght based progressions for the given exercise' do
      strenght_based_progression = create :strenght_based_progression
      get strenght_based_progressions_path(exercise_id: exercise.id), headers: @request_headers
      json_response = JSON.parse response.body

      expect(json_response['strenght_based_progressions'].first['id']).to eq strenght_based_progression.id
      expect(json_response['exercise_has_strenght_test']).to eq true
    end
  end
end
