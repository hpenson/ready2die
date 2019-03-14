class Service < ApplicationRecord
  # Direct associations

  belongs_to :theme

  belongs_to :venue,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_one    :mc,
             :through => :guest_list,
             :source => :mc

  # Validations

end
