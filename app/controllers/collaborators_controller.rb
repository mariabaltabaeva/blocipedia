class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by(email: params[:email])
    @collaborator = Collaborator.new(user: @user, wiki: @wiki)
    if @collaborator.save
      flash[:notice] = "Collaborator added."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error adding collaborator. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    collaborator = Collaborator.find(params[:id])
    if collaborator.destroy
      flash[:notice] = "Collaborator removed."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting collaborator."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
