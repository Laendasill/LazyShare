class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :react, inverse_of: :taggings
end
