class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :post_id
      t.string :viewer_id
      t.timestamps
    end
  end
end
