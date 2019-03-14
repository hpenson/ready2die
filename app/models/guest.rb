class Guest < ApplicationRecord
  # Direct associations

  has_many   :roles,
             :dependent => :destroy

  has_one    :mc,
             :dependent => :destroy

  has_many   :speakers,
             :dependent => :destroy

  has_one    :pall_bearer,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_one    :service,
             :through => :user,
             :source => :services

  # Validations

end
