class MembersController < ApplicationController
  before_action :set_member, only: [:edit, :update, :destroy]
  before_action :set_noindex

  # GET /members/new
  def new
    begin
      team = Team.find(params[:team])
    rescue => exception
      flash[:error] = "Team is not found."
      render template: "common/error"
    end
    @member = Member.new
    @member.team = team
  end

  # POST /members/new
  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to team_path(@member.team)
    else
      render :new
    end
  end

  # GET /members/:uid/edit
  def edit
  end


  # PATCH /members/:uid/edit
  def update
    if @member.update(member_params)
      redirect_to team_path(@member.team)
    else
      render :edit
    end
  end

  # DELETE /members/:uid
  def destroy
    @member.destroy
    redirect_to team_path(@member.team)
  end

  private
    # params[:uid]のMemberを検索し@memberに格納する。Memberが存在しない場合はエラーページに遷移する。
    def set_member
      begin
        @member = Member.find(params[:uid])
      rescue => exception
        flash[:error] = "Member is not found."
        render template: 'common/error'
      end
    end

    #  Strong parameters
    def member_params
      params.require(:member).permit(:team_id, :name, :role, ans_q1: [], ans_q2: [], ans_q3: [], ans_q4: [])
    end
end
