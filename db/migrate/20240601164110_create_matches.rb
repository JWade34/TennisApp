class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :user, null: false, foreign_key: true
      t.string :opponent_name
      t.date :date
      t.string :result

      t.timestamps
    end
  end
end
