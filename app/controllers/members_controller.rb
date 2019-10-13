class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  # def index
  #   @members = Member.all
  # end

  # GET /members/1
  # GET /members/1.json
  # def show
  # end

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

  # GET /members/1/edit
  def edit
  end

  # POST /memebrs
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to team_path(@member.team), notice: 'Member was successfully created.' }
        # format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        # format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to team_path(@member.team) }
        # format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        # format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to team_path(@member.team) }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      begin
        @member = Member.find(params[:uid])
      rescue => exception
        flash[:error] = "Member is not found."
        render template: 'common/error'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:team_id, :name, ans_q1: [], ans_q2: [], ans_q3: [], ans_q4: [])
    end
end
