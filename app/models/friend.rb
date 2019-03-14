class Friend < ApplicationRecord
  # Direct associations

  has_many   :connections,
             :foreign_key => "afriend_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
