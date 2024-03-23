class CreateEventPhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :event_photos do |t|
      t.string :image
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
