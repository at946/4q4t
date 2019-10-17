class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_noindex

  # GET /teams/:uid
  def show
    # メンバーカードの一覧を表示するため、チームの全メンバーの情報を@membersに格納する
    @members = @team.members
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # POST /teams/new
  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to team_path @team.uid
    else
      render :new
    end
  end

  # GET /teams/:uid/edit
  def edit
  end

  # PATCH /teams/:uid/edit
  def update
    if @team.update(team_params)
      redirect_to @team
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
      begin
        @team = Team.find(params[:uid])
      rescue => error
        flash[:error] = "Team is not found."
        render template: 'common/error'
      end
    end

    # Strong parameters
    def team_params
      params.require(:team).permit(:name)
    end
end
