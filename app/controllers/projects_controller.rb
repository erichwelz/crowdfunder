class ProjectsController < ApplicationController
  

   def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @contribution = Contribution.new
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

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

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to project_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal_in_dollars, :start_date, :finish_date, :owner_id, :public_date, :category_id)
  end



end