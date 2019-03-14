class Role < ApplicationRecord
  # Direct associations

  belongs_to :guest,
             :counter_cache => true

  # Indirect associations

  has_one    :user,
             :through => :guest,
             :source => :user

  # Validations

end
