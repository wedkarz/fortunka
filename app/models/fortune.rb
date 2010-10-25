class Fortune < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  acts_as_taggable_on :tags
  ActsAsTaggableOn::TagList.delimiter = " "
  
  def self.search(query)
    where("body like ?", "%#{query}%")
  end
end
