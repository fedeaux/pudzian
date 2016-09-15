require 'rails_helper'

RSpec.describe "StrenghtBasedProgressionStep", type: :request do
  let(:strenght_based_progression) { create :strenght_based_progression }

  describe "GET strenght_based_progressions/:progression_id/strenght_based_progression_steps" do
    it 'returns a list of strenght based progression steps' do
      set_request_headers_for :user_ray
      get strenght_based_progression_steps_path(strenght_based_progression_id: strenght_based_progression.id),
        headers: @request_headers

      expect(JSON.parse(response.body)).to have_key 'steps'
    end

    it 'forbids an user to poke around steps from another user' do
      set_request_headers_for :user_steve
      get strenght_based_progression_steps_path(strenght_based_progression_id: strenght_based_progression.id),
        headers: @request_headers

      expect(response.status).to eq 403
    end
  end

  describe "POST strenght_based_progressions/:progression_id/strenght_based_progression_steps" do
    before :each do
      set_request_headers_for :user_ray
    end

    it 'creates a new step' do
      post strenght_based_progression_steps_path(strenght_based_progression_id: strenght_based_progression.id),
        params: { strenght_based_progression_step: attributes_for(:strenght_based_progression_step) },
        headers: @request_headers

      json_response = JSON.parse response.body
      expect(json_response).to have_key 'step'
    end
  end
end
