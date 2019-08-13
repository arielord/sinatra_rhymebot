class UserWord < ActiveRecord::Base
  belongs_to :words
  belongs_to :users
end
