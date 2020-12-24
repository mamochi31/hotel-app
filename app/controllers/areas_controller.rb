class AreasController < ApplicationController
  def index
    @areas = Area.all
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    @area.save if @area.valid?
    redirect_to areas_path
  end

  private

  def area_params
    params.require(:area).permit(:code, :name)
  end
end
