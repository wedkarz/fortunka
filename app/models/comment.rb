class Comment < ActiveRecord::Base
  belongs_to :fortune
  validates_presence_of :author, :body
end
