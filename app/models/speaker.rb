class Speaker < ApplicationRecord
  # Direct associations

  belongs_to :guest

  # Indirect associations

  has_one    :user,
             :through => :guest,
             :source => :user

  # Validations

end
