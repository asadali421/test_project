class UserPolicy < ApplicationPolicy
  
  def new?
    user && user.user_type =="Manager"
  end

  def index?
    true
  end

  def destroy?
  	user && user.user_type =="Manager"
  end
  def show
  	true
  end
end