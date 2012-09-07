class UserController < ApplicationController
  def index
    @users = User.find(:all)
  end

  def create

  end

end
