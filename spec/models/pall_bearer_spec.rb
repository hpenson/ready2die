require 'rails_helper'

RSpec.describe PallBearer, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:guest) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
