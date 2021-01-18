class ChangeDatatypeRankIdOfGests < ActiveRecord::Migration[6.0]
  def change
    change_column :gests, :rank_id, :integer
  end
end
