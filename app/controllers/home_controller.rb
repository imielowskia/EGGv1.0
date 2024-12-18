class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[ index ]
  def index
    if authenticated?
      @session = Current.session
    end
  end
end
