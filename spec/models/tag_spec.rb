require 'rails_helper'

describe Tag, type: :model do
  let(:tag) { build(:tag) }
  subject { tag }

  context 'associations' do
    it { is_expected.to have_many(:recipes) }
    it { is_expected.to have_many(:taggings) }
  end
end
