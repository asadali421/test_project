class ProjectsController < ApplicationController
	before_action :authenticate_user!
  before_action :authorize_user!
  before_action :set_project, only: [:destroy, :edit, :update]
  def new
		@project = Project.new
	end

	def index
		@projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    byebug
      @project = current_user.managed_projects.new(project_params)
    if @project.save
      flash[:success] = "project was successfuly created"
      redirect_to root_path
    else
      flash[:danger] = "project was not created"
      render 'new'
    end	
  end

  def update
    if @project.update(project_params)
      flash[:success] = "project was successfuly update"
      redirect_to root_path
    else
      flash[:danger] = "project was not created"
      render 'new'
    end 
  end

  def destroy
    if @project.destroy       
      flash[:success] = "project was successfuly deleted"
      redirect_to projects_path()
    end
  end 

  def edit

  end

  def set_project
    if Project.exists?(params[:id])
      @project = Project.find(params[:id])
    else
      flash[:danger] = "project does not exists"
          redirect_to projects_path()
    end
  end

  def authorize_user!
    authorize current_user 
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end