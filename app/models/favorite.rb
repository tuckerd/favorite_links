class Favorite < ActiveRecord::Base
  attr_accessible :notes, :title, :url, :created_at

  validates :title, :url, presence: true
end
