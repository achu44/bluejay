class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :user_id
      t.string :image_url
      t.text :description

      t.timestamps
    end
  end
end
