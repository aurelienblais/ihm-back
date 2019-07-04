# frozen_string_literal: true

class Api::PiecePartsController < ApplicationController
  api :GET, '/piece_parts/', 'Return list of piece_parts'
  returns code: 200, desc: 'List of all piece_parts'

  def index
    render json: PiecePartSerializer.new(PiecePart.all).serializable_hash
  end

  api :GET, '/piece_parts/:id', 'Return a single piece part'
  param :id, :number, 'Id of the piece part', required: true
  returns code: 200, desc: 'Details of a piece part'

  def show
    render json: PiecePartSerializer.new(PiecePart.find(params[:id])).serializable_hash
  end

  api :POST, '/piece_parts/', 'Create a new piece part'
  param :piece_part_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the piece part', required: true
    param :stock, :number, 'Stock of the piece part', required: true
  end
  returns code: 200, desc: 'Newly created piece part'
  error code: 400, desc: 'An error occured while processing'

  def create
    @piece_part = PiecePart.create! piece_part_params
    render json: PiecePartSerializer.new(@piece_part).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :PATCH, '/piece_parts/:id', 'Update a piece part'
  param :piece_part_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the piece part', required: true
    param :stock, :number, 'Stock of the piece part', required: true
  end
  returns code: 200, desc: 'Updated piece part'
  error code: 400, desc: 'An error occured while processing'

  def update
    @piece_part = PiecePart.find params[:id]
    @piece_part.update! piece_part_params
    render json: PiecePartSerializer.new(@piece_part).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :DELETE, '/piece_parts/:id'
  param :id, :number, 'Id of the piece part', required: true
  returns code: 200, desc: 'Piece part has been destroyed'
  error code: 400, desc: 'An error occured while processing'

  def destroy
    @piece_part = PiecePart.find params[:id]
    @piece_part.destroy!
    head :ok
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  private

  def piece_part_params
    params.require(:piece_part).permit(
      :name,
      :stock
    )
  end
end
