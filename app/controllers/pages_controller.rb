class PagesController < ApplicationController
  def index
    redirect_to(:controller => 'tickets', :action => 'index') and return if user_signed_in?
  end
end
