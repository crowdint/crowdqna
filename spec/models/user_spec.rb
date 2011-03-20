require 'spec_helper'

describe User do
  before :each do
    @user = Fabricate(:user)
  end

  describe "#is_admin?" do
    context "The user email is in the whitelist" do
      before :each do
        @user.update_attributes(:email => User::ADMIN_USERS.first)
      end

      it "returns true" do
        @user.is_admin?.should == true
      end
    end

    context "The user is not on the whitelist" do
      it "returns false" do
        @user.is_admin?.should == false
      end
    end
  end
end
