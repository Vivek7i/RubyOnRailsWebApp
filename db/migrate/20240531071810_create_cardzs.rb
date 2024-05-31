class CreateCardzs < ActiveRecord::Migration[7.1]
  def change
    create_table :cardzs do |t|
      t.string :title
      t.text :content
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
