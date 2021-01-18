class ChangeDatatypePlanIdOfGests < ActiveRecord::Migration[6.0]
  def change
    change_column :gests, :plan_id, :integer
  end
end
