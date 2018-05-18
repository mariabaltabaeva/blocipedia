class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis


  enum role: [:standard, :premium, :admin]

end
