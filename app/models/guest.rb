class Guest < ApplicationRecord
  # Direct associations

  has_one    :mc,
             :dependent => :destroy

  has_many   :speakers,
             :dependent => :destroy

  has_one    :pall_bearer,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
