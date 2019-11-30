class DruckersController < ApplicationController
  before_action :set_member,  only: [:edit, :update]
  before_action :set_team,    only: [:index, :exercise]

  def index
    @members = @team.members
  end

  def edit
  end

  def update
    if @member.update(drucker_answers_params)
      redirect_to druckers_path(@team)
    else
      render :edit
    end
  end

  def exercise
    @members = @team.members.shuffle
  end

  private
    def set_member
      @member = Member.find(params[:uid])
      @team = @member.team
    end

    def set_team
      @team = Team.find(params[:uid])
    end  

    def drucker_answers_params
      params.require(:member).permit(ans_q1: [], ans_q2: [], ans_q3: [], ans_q4: [])
    end

end