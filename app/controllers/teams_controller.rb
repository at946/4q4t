class TeamsController < ApplicationController
  before_action :set_team, except: [:new, :create]
  before_action :set_noindex

  # GET /teams/:uid
  def show
    # メンバーカードの一覧を表示するため、チームの全メンバーの情報を@membersに格納する
    @members = @team.members
  end

  # GET /teams/new
  def new
    @team = Team.new
    render layout: 'application'
  end

  # POST /teams/new
  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to team_path(@team)
    else
      render :new, layout: "application"
    end
  end

  # GET /teams/:uid/edit
  def edit
  end

  # PATCH /teams/:uid/edit
  def update
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  # DELETE /teams/:uid
  def destroy
    @team.destroy
    redirect_to root_path
  end

  private
    # params[:uid]からTeamを検索し@teamに格納する。TeamがNot foundの場合はエラーページへ遷移させる。
    def set_team
      @team = Team.find(params[:uid])
    end

    # Strong parameters
    def team_params
      params.require(:team).permit(:name)
    end
end
