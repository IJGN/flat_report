class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_path, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_team
    @team = current_user.team
  end

  def team_params
    params.require(:team).permit(:name, :access_token)
  end
end
