# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  describe "attributes validation" do
    it { should allow_value("a@b.com").for(:email) }
    it { should_not allow_value("@b.com").for(:email) }
    it { should_not allow_value("a@b.").for(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe "relationships" do
    it { should have_many :shits }
    it { should have_many :friends }
  end

end