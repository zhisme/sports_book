class ExerciseSetsController < BaseController
  attr_reader :exercise
  helper_method :exercise

  def index
    @collection = ExerciseSet.where(date_params.merge(exercise_id: params[:exercise_id]))
  end

  def new
    @exercise = Exercise.find(params[:exercise_id])
    super
  end

  def create
    @item = resource.new(permit_params)
    @exercise = Exercise.find(params[:exercise_id])

    if item.save
      redirect_to training_exercise_path(id: exercise.id, training_id: exercise.training_id)
    else
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:exercise_id])
  end

  def update
    @exercise = Exercise.find(params[:exercise_id])

    if item.update(permit_params)
      redirect_to training_exercise_path(id: exercise.id, training_id: exercise.training_id)
    else
      render :edit
    end
  end

  private

  def permit_params
    params.require(:exercise_set).permit(:repetitions, :value).merge(params.slice(:exercise_id).permit!)
  end

  def date_params
    return {} if params[:date].blank?

    from = Date.parse(params[:date]).beginning_of_day
    to = Date.parse(params[:date]).end_of_day

    { created_at: (from..to) }
  end
end
