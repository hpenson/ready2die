class Connection < ApplicationRecord
  # Direct associations

  belongs_to :bfriend,
             :class_name => "Friend"

  belongs_to :afriend,
             :class_name => "Friend"

  belongs_to :user

  # Indirect associations

  # Validations

end
