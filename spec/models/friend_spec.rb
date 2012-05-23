# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Friend do
  subject { FactoryGirl.create(:friend) }

  context "attributes validation" do

    it { should allow_value("a@b.com").for(:email) }
    it { should_not allow_value("@b.com").for(:email) }
    it { should_not allow_value("a@b.").for(:email) }
    it { should validate_uniqueness_of(:email) }
    
  end

end