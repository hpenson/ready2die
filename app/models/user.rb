class User < ApplicationRecord
  # Direct associations

  has_many   :obituaries,
             :dependent => :destroy

  has_many   :friends,
             :dependent => :destroy

  has_many   :remains,
             :dependent => :destroy

  has_many   :executioners,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  has_many   :videos,
             :dependent => :destroy

  has_many   :expressions,
             :dependent => :destroy

  has_many   :services,
             :dependent => :destroy

  has_many   :guests,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
