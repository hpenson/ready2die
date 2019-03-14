require 'rails_helper'

RSpec.describe Discretion, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:apppointee) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
