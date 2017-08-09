require 'rails_helper'

describe Comment, type: :model do
  let(:user) { build(:user, username: "TEST") }
  let(:comment) { build(:comment, user: user) }

  subject { comment }

  context 'validations' do
    it { should validate_presence_of(:body) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:recipe) }
  end

  specify "#username" do
    expect(subject.username).to eql("TEST")
  end
end
