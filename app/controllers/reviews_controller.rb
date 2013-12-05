class ReviewsController < ApplicationController
  before_filter :load_project
  def show
    @review = Review.find(params[:id])
  end

  def create
      @review = Review.new( 
      :comment => params[:review][:comment],
      :project_id => @project.id,
      :user_id => current_user.id
      ) 

    if @review.save
      redirect_to project_path(@project), notice: 'Review created successfully'
    else
      render :action => :show
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  def edit
    @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:comment, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end