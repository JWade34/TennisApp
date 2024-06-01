class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @previous_matches = current_user.matches.order(date: :desc)
    @new_players = User.where.not(id: current_user.id).limit(5)
  end
end
