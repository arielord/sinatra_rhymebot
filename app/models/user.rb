class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :password, on: :create
  validates :email, uniqueness: true
  has_secure_password

  has_many :user_words
  has_many :words, through: :user_words
end
