class ProfilesController < ApplicationController
	
	def show
		if signed_in?
		@user = User.find(current_user.id)
		else
			redirect_to new_user_session_path
		end
	end
	
end
