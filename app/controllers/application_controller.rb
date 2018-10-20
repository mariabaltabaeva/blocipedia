class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:index, :show, :about]
  protect_from_forgery with: :exception
  include Pundit
  protect_from_forgery

end
