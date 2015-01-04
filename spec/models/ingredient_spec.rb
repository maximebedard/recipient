require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_uniqueness_of :name }

  subject { FactoryGirl.create :ingredient }

  describe '#daily_value' do
    it { expect(subject.daily_value_of(:protein)).to be_nil }
    it { expect(subject.daily_value_of(:sugar)).to be_nil }
    it { expect(subject.daily_value_of(:carbohydrate)).to eq(0.04) }
  end

  describe '#saturated_and_trans_fats' do
    it { expect(subject.saturated_and_trans_fats).to eq(Unitwise(0, 'g')) }
  end

  it 'automatically convert the unit to the canadian standard before saving' do
    subject.sodium = Unitwise(1, 'g')
    subject.save
    expect(subject.sodium.unit.to_s).to eq('mg')
  end
end
