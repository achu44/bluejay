class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :house
      t.integer :year

      t.timestamps
    end
  end
end
