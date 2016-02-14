require 'rails_helper'

describe ProfilePolicy do
  subject { described_class }

  context "for a visitor" do
    let(:member) { nil }
    let(:profile) { FactoryGirl.create(:profile) }

    permissions :index?, :show?, :new?, :edit?, :create?, :update?, :destroy? do
      it "does not grant access for non logged in user" do
        expect(subject).not_to permit(member, profile)
      end
    end
  end

  context "for a member viewing other members' profile or creating a profile" do
    let(:profile) { FactoryGirl.create(:profile) }
    let(:member) { FactoryGirl.create(:member) }

    permissions :index?, :show?, :new?, :create? do
      it "grants access to member" do
        expect(subject).to permit(member, profile)
      end
    end

    permissions :edit?, :update?, :destroy? do
      it "denies access for the member whom the profile does not belong" do
        expect(subject).not_to permit(member, profile)
      end
    end
  end

  context "for a member editing their onw profile" do
    let(:member) { FactoryGirl.create(:member) }

    permissions :edit?, :update?, :destroy? do
      it "allows member to edit their own profile" do
        expect(subject).to permit(member, Profile.create!(member_id: member.id))
      end
    end
  end
end
