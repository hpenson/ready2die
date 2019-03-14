class Service < ApplicationRecord
  # Direct associations

  belongs_to :theme

  belongs_to :venue,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_one    :expression_arrangement,
             :through => :user,
             :source => :expressions

  has_one    :video_playlist,
             :through => :user,
             :source => :videos

  has_one    :slideshow,
             :through => :user,
             :source => :photos

  has_one    :playlist,
             :through => :user,
             :source => :songs

  has_one    :mc,
             :through => :guest_list,
             :source => :mc

  # Validations

end
