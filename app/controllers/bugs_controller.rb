class BugsController < ApplicationController
before_action :set_project

  def index
    @bugs = Bug.where(project_id: @project.id)
  end

  def new 
      authorize current_user,  policy_class: BugPolicy
      @bug = Bug.new
  end

  def edit
    set_bug
  end

  def create 
    @bug = Bug.new(bug_params)
    @bug.created_by = current_user.id
    @bug.project_id = @project.id
    save_bug
  end

  def update
    set_bug
     @bug.created_by = current_user.id
    @bug.project_id = @project.id
    update_bug
  end

  def destroy
    set_bug
      delete_bug
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
    params.require(:bug).permit(:title, :description,:status,:type,:deadline,:image_path,:remove_image_path)
  end

  def save_bug
    if @bug.save
      flash[:success] = "Bug was successfuly created"
      redirect_to root_path
    else
      render 'new'
    end 
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


  def delete_bug    
        if  @bug.destroy        
      flash[:success] = "Bug was successfuly deleted"
      redirect_to project_bugs_path(@project.id)
    end
  end
end