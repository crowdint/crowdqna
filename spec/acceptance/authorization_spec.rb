require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Authorization", %q{
  In order to stay under control
  As a system
  I want to authorize users
} do

  include Warden::Test::Helpers

  scenario "Admin user" do
    user = Fabricate(:admin)
    login_as user

    visit '/admin'

    current_path.should == '/admin'
  end

  scenario "Regular user" do
    user = Fabricate(:user)
    login_as user

    visit '/admin'

    current_path.should == '/'
  end
end
