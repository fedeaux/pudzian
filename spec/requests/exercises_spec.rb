require 'rails_helper'

RSpec.describe "Exercises", type: :request do
  describe "GET /exercises" do
    it 'returns a list of exercises' do
      get exercises_path
    end
  end
end
