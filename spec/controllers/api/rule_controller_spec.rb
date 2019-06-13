require 'rails_helper'

describe Api::RulesController do
  render_views

  describe "GET #index" do
    it 'returns all rule' do
      object = FactoryBot.create :rule
      get :index
      expect(response.body).to include(object.name)
    end
  end

  describe "GET #show" do
    it 'returns rule datas' do
      object = FactoryBot.create :rule
      get :show, params: { id: object.id }
      expect(response.body).to include(object.name)
    end
  end

  describe 'POST #create' do
    context 'object is valid' do
      it 'notify success' do
        object = FactoryBot.build(:rule)
        post :create, params: { rule: object.attributes }
        expect(response.status).to eq(200)
      end
    end

    context 'object is invalid' do
      it 'notify error' do
        object = FactoryBot.build(:rule)
        post :create, params: { rule: object.attributes.except('name') }
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'PATCH #update' do
    context 'object is valid' do
      it 'notify success' do
        object = FactoryBot.create(:rule)
        patch :update, params: { id: object.id, rule: { name: 'Updated-name' } }
        expect(response.status).to eq(200)
        expect(response.body).to include('Updated-name')
      end
    end

    context 'object is invalid' do
      it 'notify error' do
        object = FactoryBot.create(:rule)
        post :update, params: { id: object.id, rule: { name: nil } }
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'deleting existent object' do
      it 'redirects to index page' do
        object = FactoryBot.create(:rule)
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
