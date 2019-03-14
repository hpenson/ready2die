class Theme < ApplicationRecord
  # Direct associations

  has_many   :services,
             :dependent => :nullify

  # Indirect associations

  has_many   :users,
             :through => :services,
             :source => :user

  # Validations

end
