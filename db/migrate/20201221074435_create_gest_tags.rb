class CreateGestTags < ActiveRecord::Migration[6.0]
  def change
    create_table :gest_tags do |t|
      t.references :gest, foreign_key: true
      t.references :tag,  foreign_key: true
      t.timestamps
    end
  end
end
