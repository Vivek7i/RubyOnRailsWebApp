class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.references :people, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end
