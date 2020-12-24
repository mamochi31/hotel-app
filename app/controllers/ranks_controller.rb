class RanksController < ApplicationController
  def index
    @ranks = Rank.all
    @rank = Rank.new
  end

  def new
  end

  def create
    # binding.pry
    @rank = Rank.new(rank_params)
    if @rank.valid?
      @rank.save
      redirect_to ranks_path
    else
      redirect_to ranks_path
    end
  end

  private

  def rank_params
    params.require(:rank).permit(:code, :name)
  end
end
