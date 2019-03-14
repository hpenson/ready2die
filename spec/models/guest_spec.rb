require 'rails_helper'

RSpec.describe Guest, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:roles) }

    it { should have_one(:mc) }

    it { should have_many(:speakers) }

    it { should have_one(:pall_bearer) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_one(:service) }

    end

    describe "Validations" do
      
    end
end
