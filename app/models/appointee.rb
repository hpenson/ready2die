class Appointee < ApplicationRecord
  # Direct associations

  has_many   :discretions,
             :foreign_key => "apppointee_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

end
