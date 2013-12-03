class ContributionsController < ApplicationController
  # before_filter :load_project

  def new
  	@contribution = Contribution.new
  end

  def create
  	@contribution = Contribution.new(contribution_params)

    if @contribution.save
      redirect_to project_url
    else
      render :new
    end
  end

  def show
  	@contribution
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to project_path
  end

  private
  def contribution_params
    params.require(:contribution).permit(:user_id, :project_id, :amount_in_dollars)
  end

  # def load_project
  #   @owner = User.find_by(params[:owner_id])    
  # end
end
