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
    exercise = Exercise.find_by id: params[:strenght_based_progression][:exercise_id]

    if exercise
      @strenght_based_progression = StrenghtBasedProgression.new strenght_based_progression_params

      if exercise.strenght_test(current_user)
        @strenght_based_progression.exercise_strenght_test = exercise.strenght_test(current_user)
        @strenght_based_progression.user = current_user
        @strenght_based_progression.save
        render :show
      else
        render json: { errors: ["Can't add a progression to an exercise without a strenght test"] }
      end
    else
      render json: { errors: ['Exercise is required'] }
    end
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
      params.require(:strenght_based_progression).permit(:string_repetitions_signature)
    end
end
