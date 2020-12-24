class RanksController < ApplicationController
  def index
    @ranks = Rank.all
    @rank = Rank.new
  end

  def create
    @rank = Rank.new(rank_params)
    @rank.save if @rank.valid?
    redirect_to ranks_path
  end

  private

  def rank_params
    params.require(:rank).permit(:code, :name)
  end
end
