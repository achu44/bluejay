class Item < ActiveRecord::Base
	attr_accessible :name, :item_type, :price, :image, :image_url, :remote_image_url, :description,
        :tag_list
    acts_as_taggable_on :tag
    belongs_to :user
    mount_uploader :image, ImageUploader
    include PgSearch
    multisearchable :against => [:name]

    pg_search_scope :search_by_name, :against => :name

    # took out sunspot
    # searchable do
    #	text :name, :description
    #	string :item_type
    #	double :price
    # end

    def self.text_search(query)
    	if query.present?
    		where("name @@ :q or description @@ :q", q: query)
    	else
    		scoped
    	end
    end
end
