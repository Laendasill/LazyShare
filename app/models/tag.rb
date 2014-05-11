class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :reacts, through: :taggings
end
