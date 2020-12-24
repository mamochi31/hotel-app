class SexesController < ApplicationController
  def index
    @sexes = Sex.all
    @sex = Sex.new
  end

  def create
    @sex = Sex.new(sex_params)
    if @sex.valid?
      @sex.save
      redirect_to sexes_path
    else
      redirect_to sexes_path
    end
  end

  private

  def sex_params
    params.require(:sex).permit(:code, :name)
  end
end
