require 'rails_helper'

RSpec.describe Friend, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:made_connections) }

    it { should have_many(:connections) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
