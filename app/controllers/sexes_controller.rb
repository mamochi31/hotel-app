class SexesController < ApplicationController
  before_action :search_sex, only: [:index, :search]
  before_action :sex_find, only: [:show, :update, :destroy]

  def index
    @sexes = Sex.all
    render template: 'sexes/search'
  end

  def new
    @sex = Sex.new
  end

  def create
    @sex = Sex.new(sex_params)
    if @sex.valid?
      @sex.save
      redirect_to new_sex_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @sex.update(sex_params)
      redirect_to sex_path(@sex.id)
    else
      render :show
    end
  end

  def destroy
    if @sex.destroy
      render template: 'success'
    else
      render :show
    end
  end

  def search
    @sexes = @q.result
  end

  private

  def sex_params
    params.require(:sex).permit(:code, :name)
  end

  def sex_find
    @sex = Sex.find(params[:id])
  end

  def search_sex
    @q = Sex.ransack(params[:q])
  end
end
