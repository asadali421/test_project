class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!
  before_action :set_project, except:[:view]
  before_action :set_bug, only:[:edit,:destroy,:update]

  def index
    @bugs = Bug.where(project_id: @project.id)
  end

  def view
    @bugs = Bug.all
    render 'index'
  end

  def new 
    @bug = Bug.new
  end

  def edit

  end

  def create 
    @bug = current_user.bugs.new(bug_params)
    @bug.project = @project
    if @bug.save
      flash[:success] = "Bug was successfuly created"
      redirect_to root_path
    else
      render 'new'
    end 
  end

  def update
    if current_user.user_type == "Developer"
      @bug.solver = current_user
    elsif current_user.user_type == "QA"
      @bug.creator = current_user
    end  
      @bug.project = @project
      update_bug
  end

  def destroy
    if  @bug.destroy        
      flash[:success] = "Bug was successfuly deleted"
      redirect_to project_bugs_path(@project.id)
    end
  end

  def update_bug
    if @bug.update(bug_params)
      flash[:success] = "Bug was successfuly updated"
      redirect_to root_path
    else
      render 'edit'
    end 
  end

  private
  def bug_params
    params.require(:bug).permit(:title, :description,:status,:type,:deadline,:image_path,:remove_image_path,@project_id)
  end

  def authorize_user!
    authorize current_user,  policy_class: BugPolicy
  end

  def set_project
    if Project.exists?(params[:project_id])
      @project = Project.find(params[:project_id])
    else
      flash[:danger] = "project does not exists"
      redirect_to projects_path()
    end
  end

  def set_bug
    if Bug.exists?(params[:id])
      @bug= Bug.find(params[:id])
    else
      flash[:danger] = "Bug does not exists"
      redirect_to projects_path()
    end
  end
end