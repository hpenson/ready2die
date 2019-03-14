class User < ApplicationRecord
  # Direct associations

  has_many   :songs,
             :dependent => :destroy

  has_many   :connections,
             :dependent => :destroy

  has_many   :discretions,
             :dependent => :destroy

  has_many   :messages,
             :dependent => :destroy

  has_many   :gifts,
             :dependent => :destroy

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

  has_many   :roles,
             :through => :guests,
             :source => :roles

  has_many   :mcs,
             :through => :services,
             :source => :mc

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
