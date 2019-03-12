class BugPolicy < ApplicationPolicy
  
  def new?
      user && user.user_type == "QA"
  end


  def index?
    true
  end

  def edit? 
    true
  end

  def destroy?
    user && user.user_type =="QA"
  end

  def update?
    user && user.user_type =="QA" || user.user_type =="Developer"
  end

  def show?
    true
  end

  def create?
    user && user.user_type =="QA"
  end

  def view?
    true
  end

end