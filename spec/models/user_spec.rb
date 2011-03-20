require 'spec_helper'

describe User do
  describe "#is_admin?" do
    context "The user email is in the whitelist" do
      before :each do
        @user = Fabricate(:admin)
      end

      it "returns true" do
        @user.is_admin?.should == true
      end
    end

    context "The user is not on the whitelist" do
      before :each do
        @user = Fabricate(:user)
      end

      it "returns false" do
        @user.is_admin?.should == false
      end
    end
  end
end
