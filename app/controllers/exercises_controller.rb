class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show]

  # GET /exercises
  def index
    @exercises = Exercise.all
    render :index
  end

  # GET /exercises/1
  def show
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exercise_params
      params.require(:exercise).permit(:name, :user_id_id)
    end
end
