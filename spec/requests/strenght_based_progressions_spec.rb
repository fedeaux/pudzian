require 'rails_helper'

RSpec.describe "StrenghtBasedProgression", type: :request do
  let(:exercise) { create_or_find_exercise(:exercise_benchpress) }
  let(:strenght_based_progression) { create :strenght_based_progression }
  let(:exercise_strenght_test) { create :exercise_strenght_test }

  describe "GET strenght_based_progressions?exercise_id=\d" do
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
      exercise_strenght_test = strenght_based_progression.exercise_strenght_test

      get strenght_based_progressions_path(exercise_id: exercise_strenght_test.exercise.id), headers: @request_headers
      json_response = JSON.parse response.body

      expect(json_response['strenght_based_progressions'].first['id']).to eq strenght_based_progression.id
      expect(json_response['exercise_has_strenght_test']).to eq true
    end
  end

  describe "GET strenght_based_progressions/:id" do
    it 'returns the StrenghtBasedProgression' do
      set_request_headers_for :user_ray
      get strenght_based_progression_path(strenght_based_progression.id), headers: @request_headers
      json_response = JSON.parse response.body

      expect(json_response).to have_key 'strenght_based_progression'
      expect(json_response['strenght_based_progression']).to have_key 'exercise'
      expect(json_response['strenght_based_progression']).to have_key 'repetitions_signature'
      expect(json_response['strenght_based_progression']).to have_key 'repetitions_with_weights'
    end

    it 'returns an error if the requesting user isn\'t the StrenghtBasedProgression owner' do
      set_request_headers_for :user_steve
      get strenght_based_progression_path(strenght_based_progression.id), headers: @request_headers
      expect(response.status).to eq 401
    end
  end

  describe "POST strenght_based_progressions" do
    before :each do
      set_request_headers_for :user_ray
    end

    it 'creates a StrenghtBasedProgression with a new signature' do
      exercise = exercise_strenght_test.exercise
      post strenght_based_progressions_path,
        params: { strenght_based_progression: { exercise_id: exercise.id, string_repetitions_signature: '6/ 6/  6/ ' }},
        headers: @request_headers

      json_response = JSON.parse response.body
      expect(json_response['strenght_based_progression']['repetitions_signature']['signature']).to eq '6/6/6'
    end

    it 'creates a StrenghtBasedProgression with an old signature' do
      signature = create :repetitions_signature

      exercise = exercise_strenght_test.exercise
      post strenght_based_progressions_path,
        params: { strenght_based_progression: { exercise_id: exercise.id, string_repetitions_signature: signature.signature }},
        headers: @request_headers

      json_response = JSON.parse response.body
      expect(json_response['strenght_based_progression']['repetitions_signature']['id']).to eq signature.id
    end

    it 'returns an error if no exercise_id is provided or the exercise doesn\'t exist' do
      post strenght_based_progressions_path,
        params: { strenght_based_progression: { exercise_id: 999 }},
        headers: @request_headers

      json_response = JSON.parse response.body
      expect(json_response).to have_key 'errors'
    end

    it 'returns an error if the exercise has no strenght test' do
      post strenght_based_progressions_path,
        params: { strenght_based_progression: { exercise_id: exercise.id }},
        headers: @request_headers

      json_response = JSON.parse response.body
      expect(json_response).to have_key 'errors'
    end
  end
end
