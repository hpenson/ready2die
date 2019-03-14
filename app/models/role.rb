class Role < ApplicationRecord
  # Direct associations

  belongs_to :guest,
             :counter_cache => true

  # Indirect associations

  # Validations

end
