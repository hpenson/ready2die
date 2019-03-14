class Friend < ApplicationRecord
  # Direct associations

  has_many   :made_connections,
             :class_name => "Connection",
             :foreign_key => "bfriend_id",
             :dependent => :destroy

  has_many   :connections,
             :foreign_key => "afriend_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
