class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_one    :service,
             :through => :user,
             :source => :services

  # Validations

end
