class CreateRoomTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :room_types do |t|
      t.string  :code,     null: false
      t.string  :name,     null: false
      t.integer :capacity, null: false
      t.timestamps
    end
  end
end
