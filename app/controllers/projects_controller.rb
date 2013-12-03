class ProjectsController < ApplicationController
  before_filter :ensure_logged_in, :except => [:index, :show]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])

    if current_user
      @project_update = ProjectUpdate.new
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :total_cost, :deadline)
  end
end
