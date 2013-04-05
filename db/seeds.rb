# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Item.create({:name => "apple", :remote_image_url => "http://www.earthtimes.org/newsimage/eating-apples-extended-lifespan-test-animals-10-per-cent_183.jpg"})
Item.create({:name => "Bike", :remote_image_url => "http://buymybikes.com/wp-content/uploads/2011/10/Bike_Comooter.jpg"})
Item.create({:name => "21a Book", :remote_image_url => "http://images.betterworldbooks.com/049/Multivariable-Calculus-9780495560548.jpg"})
Item.create({:name => "Ec 10 Book", :remote_image_url => "http://3.bp.blogspot.com/-M8y65f5_-cI/UAA97JMJGrI/AAAAAAAACzM/9YS59_wdBT0/s400/Principles+of+Economics-+Mankiw+(5th).jpg"})
Item.create({:name => "Futon", :remote_image_url => "http://bigapplefuton.com/images/futons/Arch_Style_Metal_Futon_Frame-Coaster_Co.jpg"})
Item.create({:name => "Lab Goggles", :remote_image_url => "http://uvmbookstore.uvm.edu/outerweb/product_images/10162804l.jpg"})
Item.create({:name => "T Shirt", :remote_image_url => "http://www.evo.com/imgp/1500/61500/307519/casual-industrees-umbrella-t-shirt-royal-blue-front.jpg"})
Item.create({:name => "Halo 4", :remote_image_url => "http://ecx.images-amazon.com/images/I/51KA8qJIlCL._SL500_AA300_.jpg"})
Item.create({:name => "Harvard-Yale", :remote_image_url => "http://farm5.staticflickr.com/4092/5023494590_0a92debbe9_z.jpg"})
Item.create({:name => "Rubik's Cube", :remote_image_url => "http://www.memphisflyer.com/binary/db6e/1351792080-rubiks-cube-original.jpg"})



    # t.string   "name"
    # t.integer  "user_id"
    # t.string   "image_url"
    # t.text     "description"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.integer  "price"
    # t.string   "item_type"
    # t.string   "image"
