class Mc < ApplicationRecord
  # Direct associations

  belongs_to :guest

  # Indirect associations

  has_one    :service,
             :through => :guest,
             :source => :service

  has_one    :user,
             :through => :service,
             :source => :user

  # Validations

end
