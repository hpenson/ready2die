class Message < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

end
