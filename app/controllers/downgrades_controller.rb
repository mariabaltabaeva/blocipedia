class DowngradesController < ApplicationController

  def create
    current_user.standard!
    current_user.wikis.where(private: true).update_all(private: false)
    if current_user.standard?
      flash[:notice] = "Your plan was successfully downgraded to standard."
       redirect_to edit_user_registration_path
    else
      flash.now[:alert] = "There was an error downgrading your plan."
      redirect_to edit_user_registration_path
    end
  end
end
