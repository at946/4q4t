class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_noindex

  # GET /teams
  # GET /teams.json
  # def index
  #   @teams = Team.all
  # end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @members = @team.members
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to team_path @team.uid }
        # format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        # format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        # format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        # format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    redirect_to root_path
  end

  def not_found
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      begin
        @team = Team.find(params[:uid])
      rescue => error
        flash[:error] = "Team is not found."
        render template: 'common/error'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
