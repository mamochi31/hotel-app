class PlansController < ApplicationController
  def index
    @plans = Plan.all
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.save if @plan.valid?
    redirect_to plans_path
  end

  private

  def plan_params
    params.require(:plan).permit(:code, :name, :capacity)
  end
end
