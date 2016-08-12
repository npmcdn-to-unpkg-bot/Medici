class User < ApplicationRecord
  has_many :tickets

  has_attached_file :avatar, styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>" }, default_url: "default-profile.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
