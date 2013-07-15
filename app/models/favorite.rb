class Favorite < ActiveRecord::Base
  attr_accessible :notes, :title, :url

  validates :title, :url, presence: true
  validates_format_of :url, with: URI::regexp(%w(http https)) 
end
