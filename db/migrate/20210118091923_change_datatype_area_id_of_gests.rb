class ChangeDatatypeAreaIdOfGests < ActiveRecord::Migration[6.0]
  def change
    change_column :gests, :area_id, :integer
  end
end
