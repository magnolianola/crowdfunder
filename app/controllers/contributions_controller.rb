class ContributionsController < ApplicationController
  before_filter :ensure_logged_in#, :only => [:create, :show]
  before_filter :load_project

  def new
  	@contribution = Contribution.new
  end

  def create
  	 @contribution = @project.contributions.build(contribution_params)
	 @contribution.user_id = current_user.id

	 if @contribution.save
	 	redirect_to project_path(@project)
	 else
	 	render :action => :new
	 end
  end

  def show
  	@contribution = Contribution.find(params[:id])
  end

  private
  def contribution_params
  	params.require(:contribution).permit(:amount, :project_id)
  end

  def load_project
  	@project = Project.find(params[:project_id])
  end
end
