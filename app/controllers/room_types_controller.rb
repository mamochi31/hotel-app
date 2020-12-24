class RoomTypesController < ApplicationController
  def index
    @room_types = RoomType.all
    @room_type = RoomType.new
  end
  
  def create
    @room_type = RoomType.new(room_type_params)
    if @room_type.valid?
      @room_type.save
      redirect_to room_types_path
    else
      redirect_to room_types_path
    end
  end

  private

  def room_type_params
    params.require(:room_type).permit(:code, :name, :capacity)
  end
end