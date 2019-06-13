# frozen_string_literal: true

require 'rails_helper'

describe Api::MachinesController do
  render_views

  describe 'GET #index' do
    it 'returns all machines' do
      object = FactoryBot.create :machine
      get :index
      expect(response.body).to include(object.name)
    end
  end

  describe 'GET #show' do
    it 'returns machines datas' do
      object = FactoryBot.create :machine
      get :show, params: { id: object.id }
      expect(response.body).to include(object.name)
    end
  end

  describe 'POST #create' do
    context 'object is valid' do
      it 'notify success' do
        object = FactoryBot.build(:machine)
        machine_type = FactoryBot.create(:machine_type)
        post :create, params: { machine: object.attributes.merge(machine_type_id: machine_type.id) }
        expect(response.status).to eq(200)
      end
    end

    context 'object is invalid' do
      it 'notify error' do
        object = FactoryBot.build(:machine)
        post :create, params: { machine: object.attributes.except('name') }
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'PATCH #update' do
    context 'object is valid' do
      it 'notify success' do
        object = FactoryBot.create(:machine)
        patch :update, params: { id: object.id, machine: { name: 'Updated-name' } }
        expect(response.status).to eq(200)
        expect(response.body).to include('Updated-name')
      end
    end

    context 'object is invalid' do
      it 'notify error' do
        object = FactoryBot.create(:machine)
        post :update, params: { id: object.id, machine: { name: nil } }
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'deleting existent object' do
      it 'redirects to index page' do
        object = FactoryBot.create(:machine)
        delete :destroy, params: { id: object.id }
        expect(response.status).to eq(200)
      end
    end

    context 'deleting non-existent object' do
      it 'raises error' do
        delete :destroy, params: { id: 99_999 }
        expect(response.status).to eq(400)
      end
    end
  end
end
