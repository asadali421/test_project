class BugPolicy < ApplicationPolicy
  
  def new?
      user && user.user_type == "QA"
  end

end