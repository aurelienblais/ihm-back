# frozen_string_literal: true

require 'rails_helper'

describe Machine do
  before do
    @object = FactoryBot.create(:machine)
  end

  subject { @object }

  describe 'Factory' do
    it { should be_valid }
  end

  describe 'Associations' do
    it { should have_many(:rule_steps) }
    it { should have_many(:rules) }
    it { should belong_to(:machine_type) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
