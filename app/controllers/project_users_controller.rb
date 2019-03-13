class ProjectUsersController < ApplicationController
  before_action :set_project

  def new
    @project_user = ProjectUser.new
    @users = User.where("user_type" => "Developer") 
  end

  def create
    @developer = User.find(params[:project_user][:user_id].to_i) 
    if !@developer.projects.include?(@project)
      @project_user = ProjectUser.new(developer_params)
      @project_user.project = @project
      @project_user.save
      flash[:success] = "Developer added successfully"
      redirect_to projects_path()
    else
      flash[:success] = "Developer Already exists"
      redirect_to projects_path()
    end
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
end