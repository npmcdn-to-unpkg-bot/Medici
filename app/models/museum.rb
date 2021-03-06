class Museum < ApplicationRecord
  has_many :tickets
  has_many :taggings
  has_many :tags, through: :taggings
  default_scope { where(active: true) }
  accepts_nested_attributes_for :taggings, :allow_destroy => true
  has_many :exhibits
  has_many :events
  has_many :pieces

  has_attached_file :photo, styles: { large: "768x768>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name, :blurb, :description, :photo, :price, :address
  validates_uniqueness_of :name

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
