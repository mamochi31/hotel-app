class SexesController < ApplicationController
  before_action :search_sex, only: [:index, :search]
  
  def index
    @sexes = Sex.all
  end

  def create
    @sex = Sex.new(sex_params)
    @sex.save if @sex.valid?
    redirect_to sexes_path
  end

  def search
    @sexes = @q.result
    render template: 'sexes/index'
  end

  private

  def sex_params
    params.require(:sex).permit(:code, :name)
  end

  def search_sex
    @q = Sex.ransack(params[:q])
  end
end
