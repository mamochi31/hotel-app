class RoomTypesController < ApplicationController
  def index
    @room_types = RoomType.all
    @room_type = RoomType.new
  end

  def create
    @room_type = RoomType.new(room_type_params)
    @room_type.save if @room_type.valid?
    redirect_to room_types_path
  end

  private

  def room_type_params
    params.require(:room_type).permit(:code, :name, :capacity)
  end
end
