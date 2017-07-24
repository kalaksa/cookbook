require 'rails_helper'

describe Recipe, type: :model do

  before { @recipe = FactoryGirl.build(:recipe) }

  subject { @recipe }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:components) }

  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:taggings) }
  it { is_expected.to have_many(:tags) }
  it { is_expected.to belong_to(:user) }
end
