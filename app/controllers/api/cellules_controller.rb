# frozen_string_literal: true

class Api::CellulesController < ApplicationController
  api :GET, '/cellules/', 'Return list of cellules'
  returns code: 200, desc: 'List of all cellules'

  def index
    render json: CelluleSerializer.new(Cellule.all).serializable_hash
  end

  api :GET, '/cellules/:id', 'Return a single cellule'
  param :id, :number, 'Id of the cellule', required: true
  returns code: 200, desc: 'Details of a cellule'

  def show
    render json: CelluleSerializer.new(Cellule.find(params[:id])).serializable_hash
  end

  api :POST, '/cellules/', 'Create a new cellule'
  param :cellule_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the cellule', required: true
  end
  returns code: 200, desc: 'Newly created cellule'
  error code: 400, desc: 'An error occured while processing'

  def create
    @cellule = Cellule.create! cellule_params
    render json: CelluleSerializer.new(@cellule).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :PATCH, '/cellules/:id'
  param :id, :number, 'Id of the cellule', required: true
  param :cellule_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the cellule', required: true
  end
  returns code: 200, desc: 'Updated cellule'
  error code: 400, desc: 'An error occured while processing'

  def update
    @cellule = Cellule.find params[:id]
    @cellule.update! cellule_params
    render json: CelluleSerializer.new(@cellule).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :DELETE, '/cellules/:id'
  param :id, :number, 'Id of the cellule', required: true
  returns code: 200, desc: 'Cellule has been destroyed'
  error code: 400, desc: 'An error occured while processing'

  def destroy
    @cellule = Cellule.find params[:id]
    @cellule.destroy!
    head :ok
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  private

  def cellule_params
    params.require(:cellule).permit(
      :name
    )
  end
end
