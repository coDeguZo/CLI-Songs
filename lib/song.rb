class Song < ActiveRecord::Base
  has_many :song_users
  has_many :users, through: :song_users

end