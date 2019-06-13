# frozen_string_literal: true

require 'rails_helper'

describe Rule do
  before do
    @object = FactoryBot.create(:rule)
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
  end
end
