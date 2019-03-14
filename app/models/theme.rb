class Theme < ApplicationRecord
  # Direct associations

  has_many   :services,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
