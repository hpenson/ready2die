class Song < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  has_one    :service,
             :through => :user,
             :source => :services

  # Validations

end
