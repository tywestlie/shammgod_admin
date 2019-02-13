class User < ApplicationRecord
  has_many :articles

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password 
  enum role: [:default, :admin]
  has_secure_password
end
