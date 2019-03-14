require 'rails_helper'

RSpec.describe Service, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:theme) }

    it { should belong_to(:venue) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_one(:guest_list) }

    it { should have_one(:expression_arrangement) }

    it { should have_one(:video_playlist) }

    it { should have_one(:slideshow) }

    it { should have_one(:playlist) }

    it { should have_one(:mc) }

    end

    describe "Validations" do
      
    end
end
