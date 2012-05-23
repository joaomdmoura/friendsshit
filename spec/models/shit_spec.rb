# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Shit do
  subject { FactoryGirl.create(:shit) }

  describe "relationships" do
    it { should have_many :user }
  end

end