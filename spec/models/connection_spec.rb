require 'rails_helper'

RSpec.describe Connection, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:bfriend) }

    it { should belong_to(:afriend) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
