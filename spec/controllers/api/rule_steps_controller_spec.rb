require 'rails_helper'

describe Api::RuleStepsController do
  render_views

  describe "GET #index" do
    it 'returns all rule step' do
      object = FactoryBot.create :rule_step
      get :index
      expect(response.body).to include(object.name)
    end
  end

  describe "GET #show" do
    it 'returns rule step datas' do
      object = FactoryBot.create :rule_step
      get :show, params: { id: object.id }
      expect(response.body).to include(object.name)
    end
  end

  describe 'POST #create' do
    context 'object is valid' do
      it 'notify success' do
        object = FactoryBot.build(:rule_step)
        rule = FactoryBot.create(:rule)
        machine = FactoryBot.create(:machine)
        piece_part = FactoryBot.create(:piece_part)
        post :create, params: { rule_step: object.attributes.merge(rule_id: rule.id, machine_id: machine.id, piece_part_id: piece_part.id) }
        expect(response.status).to eq(200)
      end
    end

    context 'object is invalid' do
      it 'notify error' do
        object = FactoryBot.build(:rule_step)
        post :create, params: { rule_step: object.attributes.except('name') }
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'PATCH #update' do
    context 'object is valid' do
      it 'notify success' do
        object = FactoryBot.create(:rule_step)
        patch :update, params: { id: object.id, rule_step: { name: 'Updated-name' } }
        expect(response.status).to eq(200)
        expect(response.body).to include('Updated-name')
      end
    end

    context 'object is invalid' do
      it 'notify error' do
        object = FactoryBot.create(:rule_step)
        post :update, params: { id: object.id, rule_step: { name: nil } }
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'deleting existent object' do
      it 'redirects to index page' do
        object = FactoryBot.create(:rule_step)
        delete :destroy, params: { id: object.id }
        expect(response.status).to eq(200)
      end
    end

    context 'deleting non-existent object' do
      it 'raises error' do
        delete :destroy, params: { id: 99999 }
        expect(response.status).to eq(400)
      end
    end
  end
end
