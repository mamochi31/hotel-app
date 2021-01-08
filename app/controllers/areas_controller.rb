class AreasController < ApplicationController
  before_action :search_area, only: [:index, :search]
  before_action :area_find, only: [:show, :update, :destroy]

  def index
    @areas = Area.all
    render template: 'areas/search'
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new(area_params)
    if @area.valid?
      @area.save 
      redirect_to new_area_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @area.update(area_params)
      redirect_to area_path(@area.id)
    else
      render :show
    end
  end

  def destroy
    if @area.destroy
      render template: 'success'
    else
      render :show
    end
  end

  def search
    @areas = @q.result
  end

  private

  def area_params
    params.require(:area).permit(:code, :name)
  end

  def area_find
    @sex = Area.find(params[:id])
  end

  def search_area
    @q = Area.ransack(params[:q])
  end
end
