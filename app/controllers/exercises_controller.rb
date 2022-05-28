class ExercisesController < BaseController
  attr_reader :training, :dates
  helper_method :training, :dates

  def show
    @dates = item.exercise_sets.map(&:perform_date).uniq
  end

  def new
    @training = Training.find(params[:training_id])
    super
  end

  def create
    @item = resource.new(permit_params)

    if item.save
      redirect_to trainings_path
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:exercise).permit(:name).merge(params.slice(:training_id).permit!)
  end
end
