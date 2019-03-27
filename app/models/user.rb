class User < ActiveRecord::Base
  has_many :tickets

  validates :user_name, presence: true, uniqueness: true
end