# frozen_string_literal: true

class Api::MachineTypesController < ApplicationController
  api :GET, '/machine_types/', 'Return list of machines types'
  returns code: 200, desc: 'List of all machines types'

  def index
    render json: MachineTypeSerializer.new(MachineType.all).serializable_hash
  end

  api :GET, '/machine_types/:id', 'Return a single machine type'
  param :id, :number, 'Id of the machine type', required: true
  returns code: 200, desc: 'Details of a machine type'

  def show
    render json: MachineTypeSerializer.new(MachineType.find(params[:id])).serializable_hash
  end

  api :POST, '/machine_types/', 'Create a new machine type'
  param :machine_type_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the machine type', required: true
  end
  returns code: 200, desc: 'Newly created machine type'
  error code: 400, desc: 'An error occured while processing'

  def create
    @machine_type = MachineType.create! machine_type_params
    render json: MachineTypeSerializer.new(@machine_type).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :PATCH, '/machine_types/:id', 'Update a machine type'
  param :machine_type_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the machine type', required: true
  end
  returns code: 200, desc: 'Updated machine'
  error code: 400, desc: 'An error occured while processing'

  def update
    @machine_type = MachineType.find params[:id]
    @machine_type.update! machine_type_params
    render json: MachineTypeSerializer.new(@machine_type).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :DELETE, '/machine_types/:id'
  param :id, :number, 'Id of the machine type', required: true
  returns code: 200, desc: 'Machine type has been destroyed'
  error code: 400, desc: 'An error occured while processing'

  def destroy
    @machine_type = MachineType.find params[:id]
    @machine_type.destroy!
    head :ok
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  private

  def machine_type_params
    params.require(:machine_type).permit(
      :name
    )
  end
end
