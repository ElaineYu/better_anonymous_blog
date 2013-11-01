class CreateInstances < ActiveRecord::Migration
  def change
  	create_table :instances do |t|
  		#t.belongs_to --> this automatically creates a post_id and tag_id
  		t.belongs_to :post
  		t.belongs_to :tag
  	end
  end
end
