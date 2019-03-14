require 'rails_helper'

RSpec.describe Theme, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:services) }

    end

    describe "InDirect Associations" do

    it { should have_many(:users) }

    end

    describe "Validations" do
      
    end
end
