class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :game, null: false, foreign_key: true
      t.string :url, null:false
      t.timestamps
    end
  end
end
