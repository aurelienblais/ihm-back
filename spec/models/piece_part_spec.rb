require 'rails_helper'

describe PiecePart do
  before do
    @object = FactoryBot.create(:piece_part)
  end

  subject { @object }

  describe 'Factory' do
    it { should be_valid }
  end

  describe 'Associations' do
    it { should have_many(:rule_steps) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:stock) }
  end

end
