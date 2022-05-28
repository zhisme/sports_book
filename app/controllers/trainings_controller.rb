class TrainingsController < BaseController
  private

  def permit_params
    params.require(:training).permit(:name)
  end
end
