class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :user
  validates :title, :components, :body, presence: true
  mount_uploader :image, RecipeImageUploader

  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    self.tags.map(&:name).join(", ")
  end

  def tag_list=(tags_string)
    tags_names = tags_string.split( "," ).collect { |s| s.strip.downcase }.uniq
    new_or_found_tags = tags_names.collect{ |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
