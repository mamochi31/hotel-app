class SexesController < ApplicationController
  def index
    @sexes = Sex.all
    @sex = Sex.new
  end

  def create
    @sex = Sex.new(sex_params)
    @sex.save if @sex.valid?
    redirect_to sexes_path
  end

  private

  def sex_params
    params.require(:sex).permit(:code, :name)
  end
end
