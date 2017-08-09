require 'rails_helper'

describe User, type: :model do
  let(:user) { build(:user) }
  let(:admin) { build(:user, :admin) }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  context 'associations' do
    it { is_expected.to have_many(:recipes) }
    it { is_expected.to have_many(:comments) }
  end

  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_confirmation_of(:password) }
  end

  it { should allow_value('example@domain.com').for(:email) }
  it { should_not allow_value('').for(:email) }

  context 'if the user is not admin' do
    subject { user }
    it { should_not be_admin }
    it { should be_valid }
  end

  context 'if the user is admin' do
    subject { admin }
    it { should be_admin }
    it { should be_valid }
  end
end
