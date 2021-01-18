class ChangeDatatypeSexIdOfGests < ActiveRecord::Migration[6.0]
  def change
    change_column :gests, :sex_id, :integer
  end
end
