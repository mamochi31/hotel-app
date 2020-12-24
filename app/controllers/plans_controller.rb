class PlansController < ApplicationController
  def index
    @plans = Plan.all
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    if @plan.valid?
      @plan.save
      redirect_to plans_path
    else
      redirect_to plans_path
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:code, :name, :capacity)
  end
end