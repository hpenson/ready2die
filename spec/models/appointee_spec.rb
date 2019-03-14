require 'rails_helper'

RSpec.describe Appointee, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:discretions) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
