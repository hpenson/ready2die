class Discretion < ApplicationRecord
  # Direct associations

  belongs_to :apppointee,
             :required => false,
             :class_name => "Appointee",
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
