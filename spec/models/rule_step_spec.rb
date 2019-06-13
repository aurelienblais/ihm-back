require 'rails_helper'

describe RuleStep do
  before do
    @object = FactoryBot.create(:rule_step)
  end

  subject { @object }

  describe 'Factory' do
    it { should be_valid }
  end

  describe 'Associations' do
    it { should belong_to(:rule) }
    it { should belong_to(:machine) }
    it { should belong_to(:piece_part) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:order) }
  end

end
