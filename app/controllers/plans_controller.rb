class PlansController < ApplicationController
  before_action :search_plan, only: [:index, :search]
  before_action :plan_find, only: [:show, :update, :destroy]

  def index
    @plans = Plan.all
    render template: 'plans/search'
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.valid?
      @plan.save 
      redirect_to new_plan_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @plan.update(plan_params)
      redirect_to plan_path(@plan.id)
    else
      render :show
    end
  end

  def destroy
    if @plan.destroy
      render template: 'success'
    else
      render :show
    end
  end

  def search
    @plans = @q.result
  end

  private

  def plan_params
    params.require(:plan).permit(:code, :name)
  end

  def plan_find
    @plan = Plan.find(params[:id])
  end

  def search_plan
    @q = Plan.ransack(params[:q])
  end
end
