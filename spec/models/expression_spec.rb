require 'rails_helper'

RSpec.describe Expression, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_one(:service) }

    end

    describe "Validations" do
      
    end
end
