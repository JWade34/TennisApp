class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where(active: true).where.not(id: current_user.id)
  end
end
