require 'spec_helper'

describe ShitsController do
  
  let!(:shit) { FactoryGirl.create :shit }
  let!(:user) { FactoryGirl.create :user }
  let!(:friend) { FactoryGirl.create :friend, { :user => user, :shit => shit } }

  describe "GET index" do
    it "should get all Shits" do
      get :index, :page => 1
      assigns(:shits).should == Shit.all[0, 6]
    end
  end

  describe "GET create" do
    it "should get all Shits" do
      get :create, { :shit => { :phrase => "My shit said",
      												:photo	=> "My photo",
      												:video	=> "My video on youtube" },
                     :friend => { :name => "Test User" }}
      assigns(:shit).should == Shit.last
    end
  end

end
