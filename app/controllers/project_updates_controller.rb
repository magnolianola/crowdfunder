class ProjectUpdatesController < ApplicationController
	before_filter :load_project

  def show
  	@project_update = ProjectUpdate.find(params[:id])
  end

  def new
  	@project_update = ProjectUpdate.new
  end

  def create
  	@project_update = @project.project_updates.build(project_update_params)

  	@project_update.user = current_user
  	if @project_update.save
  		redirect_to project_path(@project), notice: "Update saved"
  		
  	else
  		render "/projects/show"
  	end
  end

  private

  def project_update_params
  	params.require(:project_update).permit(:comment, :project_id, :user_id)
  end

  def load_project
  	@project = Project.find(params[:project_id])
  end
end
