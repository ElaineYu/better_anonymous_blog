class Post < ActiveRecord::Base

  validates :body, :presence => true
  validates :title, :presence => true
  validates :title, :uniqueness => true

  
  has_many :instances
  has_many :tags, :through => :instances
end
