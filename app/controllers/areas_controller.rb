class AreasController < ApplicationController
  def index
    @areas = Area.all
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    if @area.valid?
      @area.save
      redirect_to areas_path
    else
      redirect_to areas_path
    end
  end

  private

  def area_params
    params.require(:area).permit(:code, :name)
  end
end
