class AboutsController < ApplicationController
  def show
    @teams = Team.members
  end
end
