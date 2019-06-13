# frozen_string_literal: true

require 'rails_helper'

describe Api::PiecePartsController do
  render_views

  describe 'GET #index' do
    it 'returns all piece part' do
      object = FactoryBot.create :piece_part
      get :index
      expect(response.body).to include(object.name)
    end
  end

  describe 'GET #show' do
    it 'returns piece part datas' do
      object = FactoryBot.create :piece_part
      get :show, params: { id: object.id }
      expect(response.body).to include(object.name)
    end
  end

  describe 'POST #create' do
    context 'object is valid' do
      it 'notify success' do
        object = FactoryBot.build(:piece_part)
        post :create, params: { piece_part: object.attributes }
        expect(response.status).to eq(200)
      end
    end

    context 'object is invalid' do
      it 'notify error' do
        object = FactoryBot.build(:piece_part)
        post :create, params: { piece_part: object.attributes.except('name') }
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'PATCH #update' do
    context 'object is valid' do
      it 'notify success' do
        object = FactoryBot.create(:piece_part)
        patch :update, params: { id: object.id, piece_part: { name: 'Updated-name' } }
        expect(response.status).to eq(200)
        expect(response.body).to include('Updated-name')
      end
    end

    context 'object is invalid' do
      it 'notify error' do
        object = FactoryBot.create(:piece_part)
        post :update, params: { id: object.id, piece_part: { name: nil } }
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'deleting existent object' do
      it 'redirects to index page' do
        object = FactoryBot.create(:piece_part)
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
