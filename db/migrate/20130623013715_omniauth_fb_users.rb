class OmniauthFbUsers < ActiveRecord::Migration
  def up
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  end

  def down
  end
end
