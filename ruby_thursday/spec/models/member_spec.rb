require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(FactoryGirl.create(:member)).to be_valid
    end

    it { should validate_presence_of(:name) }
    
  end
end
