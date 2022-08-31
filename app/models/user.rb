class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :address, presence: true
  after_validation :geocode
  geocoded_by :address

  def full_description
    [name, address].join(' - ')
  end

  after_create do
    broadcast_prepend_to "users"
  end
  after_update do
    broadcast_update_to "users"
  end
  after_destroy_commit do
    broadcast_remove_to "users"
  end

  def to_s
    name
  end
end
