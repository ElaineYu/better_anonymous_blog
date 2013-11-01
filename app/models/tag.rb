class Tag < ActiveRecord::Base
	has_many :instances
	has_many :posts, :through => :instances
end
