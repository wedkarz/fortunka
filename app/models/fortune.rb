class Fortune < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates_length_of :body, :minimum => 8
  acts_as_taggable_on :tags
  ActsAsTaggableOn::TagList.delimiter = " "
  
  
  def self.search(query, page)
    paginate :per_page => 5, :page => page,
           :conditions => ['body like ?', "%#{query}%"],
           :order => 'created_at desc'
  end
  
end
