require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:songs) }

    it { should have_many(:connections) }

    it { should have_many(:discretions) }

    it { should have_many(:messages) }

    it { should have_many(:gifts) }

    it { should have_many(:obituaries) }

    it { should have_many(:friends) }

    it { should have_many(:remains) }

    it { should have_many(:executioners) }

    it { should have_many(:photos) }

    it { should have_many(:videos) }

    it { should have_many(:expressions) }

    it { should have_many(:services) }

    it { should have_many(:guests) }

    end

    describe "InDirect Associations" do

    it { should have_many(:venues) }

    it { should have_many(:themes) }

    it { should have_many(:pall_bearers) }

    it { should have_many(:speakers) }

    it { should have_many(:roles) }

    it { should have_many(:mcs) }

    end

    describe "Validations" do
      
    end
end
