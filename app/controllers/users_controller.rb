class UsersController < ApplicationController
def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			# UserMailer.welcome_email(@user).deliver
			redirect_to projects_url, :notice => "signed up!"
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])		
	end

	def update
		@user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user) 
    else
      render :edit
    end
	end

	def show
		@user = User.find(params[:id])
	end

	private 

	def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end	


