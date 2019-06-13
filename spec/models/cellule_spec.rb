# frozen_string_literal: true

require 'rails_helper'

describe Cellule do
  before do
    @object = FactoryBot.create(:cellule)
  end

  subject { @object }

  describe 'Factory' do
    it { should be_valid }
  end

  describe 'Associations' do
    it { should have_many(:machines) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
