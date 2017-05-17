class PageController < ApplicationController
  def main
    redirect_to "/users/#{current_user.id}"
  end
end
