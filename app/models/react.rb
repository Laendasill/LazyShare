class React < ActiveRecord::Base
  belongs_to :album
  has_many :taggings
  has_many :tags, through: :taggings
  mount_uploader :image, ImageUploader
  def self.Tagged_with(name)
    Tag.find_by_name!(name).reacts
  end

  def self.tag_counts
    Tag.select("Tags.*,count(taggings.tag_id) as count").
               joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag(tag)
    if tag.class == String

   t= Tag.where(name: tag.strip).first_or_create!
    else
      t= Tag.where(name: tag.name.strip).first_or_create!
    end
    # TO DO create new tags if they dont exist
    Tagging.create(tag_id: t.id, react_id: self.id)
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
    end
  end
end
