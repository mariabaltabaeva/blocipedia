class CollaboratorsController < ApplicationController

  def create
    if current_user.wikis.where(private: true)
      @collaborator = Collaborator.create(user: current_user, wiki: )
  end
end
