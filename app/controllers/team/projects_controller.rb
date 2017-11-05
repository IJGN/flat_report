class Team::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.team.projects
  end

  def show
  end

  def new
    @project = current_user.team.projects.new
  end

  def edit
  end

  def create
    @project = current_user.team.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to [:team, @project], notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to [:team, @project], notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to team_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def project_params
    params.require(:project).permit(:client_name, :project_name, :status, :description, :scheduled_time, :actual_time)
  end

  def set_project
    @project = current_user.team.projects.find(params[:id])
  end
end
