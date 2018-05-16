class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  before_save { self.role ||= :standard }
  #after_initialize :standard


  #def standard
  #end

  enum role: [:standard, :premium, :admin]
end
