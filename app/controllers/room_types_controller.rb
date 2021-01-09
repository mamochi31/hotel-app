class RoomTypesController < ApplicationController
  before_action :search_room_type, only: [:index, :search]
  before_action :room_type_find, only: [:show, :update, :destroy]

  def index
    @room_types = RoomType.all
    render template: 'room_types/search'
  end

  def new
    @room_type = RoomType.new
  end

  def create
    @room_type = RoomType.new(room_type_params)
    if @room_type.valid?
      @room_type.save
      redirect_to new_room_type_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if @room_type.update(room_type_params)
      redirect_to room_type_path(@room_type.id)
    else
      render :show
    end
  end

  def destroy
    if @room_type.destroy
      render template: 'success'
    else
      render :show
    end
  end

  def search
    @room_types = @q.result
  end

  private

  def room_type_params
    params.require(:room_type).permit(:code, :name, :capacity)
  end

  def room_type_find
    @room_type = RoomType.find(params[:id])
  end

  def search_room_type
    @q = RoomType.ransack(params[:q])
  end
end
