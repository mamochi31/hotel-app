class ChangeDatatypeRoomTypeIdOfGests < ActiveRecord::Migration[6.0]
  def change
    change_column :gests, :room_type_id, :integer
  end
end
