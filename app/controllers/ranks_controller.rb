class RanksController < ApplicationController
  before_action :search_rank, only: [:index, :search]
  before_action :rank_find, only: [:show, :update, :destroy]

  def index
    @ranks = Rank.all
    render template: 'ranks/search'
  end

  def new
    @rank = Rank.new
  end

  def create
    @rank = Rank.new(rank_params)
    if @rank.valid?
      @rank.save
      redirect_to new_rank_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @rank.update(rank_params)
      redirect_to rank_path(@rank.id)
    else
      render :show
    end
  end

  def destroy
    if @rank.destroy
      render template: 'success'
    else
      render :show
    end
  end

  def search
    @ranks = @q.result
  end

  private

  def rank_params
    params.require(:rank).permit(:code, :name)
  end

  def rank_find
    @rank = Rank.find(params[:id])
  end

  def search_rank
    @q = Rank.ransack(params[:q])
  end
end
