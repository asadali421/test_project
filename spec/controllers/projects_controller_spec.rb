require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  context "projects#create" do
    let (:user) {create(:user)} 
    let (:project) {build(:project)}
    let (:valid_params) {
      {
        title: 'asdasda',
        description: 'asdasdasdasdasd'
      }
    }
    before {sign_in user}
    it "QA cannot create projects" do
      expect {post :create, params: {project: valid_params}}.to change{Project.all.count}.by (1)
    end

    # it "Developer cannot create projects" do
    #   user = User.create!(name:"name",email:"email@email.com",password:"Password",user_type:"Developer")
    #   project = Project.create!(title:"title",description:"description")
    #   post :projects, params:{id:project.to_param,user_id:user.to_param}
    #   expect(response).to be_failure
    # end
    
  end

end
