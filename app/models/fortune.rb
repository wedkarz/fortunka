class Fortune < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates_length_of :body, :minimum => 8
  acts_as_taggable_on :tags
  ActsAsTaggableOn::TagList.delimiter = " "
  
  # ilosc fortunek na stronie
  self.per_page = 5
  
  def self.search(query)
    where("body like ?", "%#{query}%")
  end
end
