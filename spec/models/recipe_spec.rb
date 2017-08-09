require 'rails_helper'

describe Recipe, type: :model do
  let(:user) { build(:user, username: "TEST") }
  let(:recipe) { build(:recipe, user: user) }

  subject { recipe }

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:components) }
  end

  context 'associations' do
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:taggings) }
    it { is_expected.to have_many(:tags) }
    it { is_expected.to belong_to(:user) }
  end

  specify "#username" do
    expect(subject.user.username).to eql("TEST")
  end
end
