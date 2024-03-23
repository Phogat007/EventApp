class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :place
      t.string :coordinator_name
      t.string :department
      t.string :winner_name
      t.boolean :approved
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
