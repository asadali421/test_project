class ProjectUsersController < ApplicationController
  before_action :set_project
    
    def new
		  @project_user = ProjectUser.new
		  @users = User.where("user_type" => "Developer") 
    end
    
    def create
		  @project_user = ProjectUser.new(developer_params)
		  @project_user.project_id = @project.id
     
		  save_developer
    end
    
    def developer_params
      params.require(:project_user).permit(:user_id)  
    end

	  def set_project
		  if Project.exists?(params[:project_id])
			 @project = Project.find(params[:project_id])
		  else
			 flash[:danger] = "project does not exists"
      	redirect_to projects_path()
		  end
	  end

	def save_developer
		if !ProjectUser.find_by(user_id:@project_user.user_id, project_id: @project_user.project_id)
       flash[:success] = "Developer added successfully"
		  @project_user.save
			redirect_to projects_path()
		else
      flash[:success] = "Developer Already exists"
			redirect_to projects_path()
		end	
	end
end