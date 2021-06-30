class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save!
			render json: @user
		else
			render error: {error: 'unable to create a user'}, status: 400
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :age, :email)
	end
end
