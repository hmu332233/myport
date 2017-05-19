class PageController < ApplicationController
  
  before_action :authenticate_user!

  def main
    redirect_to "/user/#{current_user.id}"
  end
end
