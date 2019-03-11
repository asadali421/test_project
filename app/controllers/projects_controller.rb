class ProjectsController < ApplicationController
	
	def new
		authorize current_user
		@project = Project.new
		

	end

	def index
		@projects = Project.all
	end

	def show
		set_project
  		@project_developer = ProjectUser.where(project_id: @project.id)
	end

	def create
		@project = Project.new(project_params)
		@project_user = ProjectUser.new
		@project_user.project = @project
		@project_user.user = current_user
		save_project
	end

	def update
		
	end

	def destroy
		delete_project
	end

	def edit
		set_project
	end

	def update
		set_project
		edit_project
	end

	def set_project
		if Project.exists?(params[:id])
			@project = Project.find(params[:id])
		else
			flash[:danger] = "project does not exists"
      		redirect_to projects_path()
		end
	end

	def edit_project
		if @project.update(project_params)
			
			flash[:success] = "project was successfuly updated"
			redirect_to root_path
			
		else
			render 'index'
		end	
	end

	private
	def project_params
		params.require(:project).permit(:title, :description,:user)
	end

	def save_project
		if @project.save
			if @project_user.save
			flash[:success] = "project was successfuly created"
			redirect_to root_path
			end
		else
			render 'index'
		end	
	end

	def delete_project		
      	if	@project.destroy    		
			flash[:success] = "project was successfuly deleted"
			redirect_to projects_path()
		end
	end


	
	

	
end