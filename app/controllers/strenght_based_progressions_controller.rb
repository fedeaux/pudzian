class StrenghtBasedProgressionsController < ApplicationController
  def index
    @exercise_has_strenght_test = false

    if params[:exercise_id]
      exercise = Exercise.find params[:exercise_id]
      exercise_strenght_test = exercise.strenght_test current_user

      if exercise_strenght_test
        @strenght_based_progressions = exercise_strenght_test.strenght_based_progressions
        @exercise_has_strenght_test = true
      end
    end

    @strenght_based_progressions ||= []
  end

  def create
    @strenght_based_progression = StrenghtBasedProgression.new strenght_based_progression_params
    @strenght_based_progression.user = current_user
    @strenght_based_progression.save
    render :show
  end

  def update
    @strenght_based_progression = StrenghtBasedProgression.find params[:id]
    if @strenght_based_progression.user.id == current_user.id
      @strenght_based_progression.update strenght_based_progression_params
      render :show
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def strenght_based_progression_params
      params.require(:strenght_based_progression).permit(:exercise_id, :precision, :unit, :mr_weights => ExerciseStrenghtTest::REPETITION_REGIONS.map(&:to_s))
    end
end
