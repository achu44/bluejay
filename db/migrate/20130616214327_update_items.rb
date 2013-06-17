class UpdateItems < ActiveRecord::Migration
  def up
  	add_column :items, :price, :integer
  	add_column :items, :place, :string
  end

  def down
  end
end
