class DruckersController < ApplicationController

  def index
    begin
      @team = Team.find(params[:team])
    rescue => exception
      flash[:error] = "Team is not found."
      render template: "common/error"
    end
    @members = @team.members
  end

  def edit
  end

end