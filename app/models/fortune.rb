class Fortune < ActiveRecord::Base
def self.search(query)
  where("body like ?", "%#{query}%")
end
end
