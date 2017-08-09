module ControllerMacros
  def login_admin
    before(:each) do
      admin = FactoryGirl.create(:admin)
      sign_in :user, admin
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      user.confirm
      sign_in user
    end
  end
end