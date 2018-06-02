class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborators
  has_many :wiki_collaborations, through: :collaborators, source: :wiki


  enum role: [:standard, :premium, :admin]

end
