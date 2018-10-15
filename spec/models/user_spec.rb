require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) {FactoryBot.create :user}
  subject {user}

  describe "validation" do
    it "has a valid" do
      expect(user).to be_valid
    end

    it "has a invalid validate" do
      user.email = nil
      user.password = nil
      expect(user).to_not be_valid
    end

    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_presence_of :password}
  end

  context "when email is not valid" do
    before {subject.email = ""}
    it {is_expected.not_to be_valid}
  end

  context "columns" do
    it {is_expected.to have_db_column(:name).of_type :string}
    it {is_expected.to have_db_column(:email).of_type :string}
  end
end
