class CreateRanks < ActiveRecord::Migration[6.0]
  def change
    create_table :ranks do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
