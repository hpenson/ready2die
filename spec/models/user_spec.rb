require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:expressions) }

    it { should have_many(:services) }

    it { should have_many(:guests) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
