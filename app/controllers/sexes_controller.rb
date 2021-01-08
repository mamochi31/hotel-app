class SexesController < ApplicationController
  before_action :search_sex, only: [:index, :search]
  
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

  def search
    @sexes = @q.result
  end

  private

  def sex_params
    params.require(:sex).permit(:code, :name)
  end

  def search_sex
    @q = Sex.ransack(params[:q])
  end
end
