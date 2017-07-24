require 'rails_helper'

describe Comment, type: :model do

  before { @comment = FactoryGirl.build(:comment) }

  subject { @comment }
  it { should validate_presence_of(:body) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:recipe) }
end
