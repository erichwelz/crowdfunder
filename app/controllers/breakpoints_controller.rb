class BreakpointsController < ApplicationController

  def new
  	@breakpoint = Breakpoint.new
  end

  def create
  	@breakpoint = Breakpoint.new(breakpoint_params)
  	if @breakpoint.save
    	redirect_to project_url(Project.find(@breakpoint.project_id))
    else
      render :new
    end
  end

  def edit
  	@breakpoint = Breakpoint.find(params[:id])
  end

  

  private
  def breakpoint_params
  	params.require(:breakpoint).permit(:project_id, :breakpoint_amout, :breakpoint_name)
  end
end
