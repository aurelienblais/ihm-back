# frozen_string_literal: true

class Api::MachinesController < ApplicationController
  api :GET, '/machines/', 'Return list of machines'
  returns code: 200, desc: 'List of all machines'

  def index
    render json: MachineSerializer.new(Machine.all).serializable_hash
  end

  api :GET, '/machines/:id', 'Return a single machine'
  param :id, :number, 'Id of the machine', required: true
  returns code: 200, desc: 'Details of a machine'

  def show
    render json: MachineSerializer.new(Machine.find(params[:id])).serializable_hash
  end

  api :POST, '/machines/', 'Create a new machine'
  param :machine_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the machine', required: true
    param :available, [true, false], 'Status of the machine', required: true
    param :cellule_id, Integer, 'ID of the belonging cellule', required: true
    param :machine_type_id, Integer, 'ID of the belonging machine type', required: true
  end
  returns code: 200, desc: 'Newly created machine'
  error code: 400, desc: 'An error occured while processing'

  def create
    @machine = Machine.create! machine_params
    render json: MachineSerializer.new(@machine).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :PATCH, '/machines/:id', 'Update a machine'
  param :machine_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the machine', required: true
    param :available, [true, false], 'Status of the machine', required: true
    param :cellule_id, Integer, 'ID of the belonging cellule', required: true
    param :machine_type_id, Integer, 'ID of the belonging machine type', required: true
  end
  returns code: 200, desc: 'Updated machine'
  error code: 400, desc: 'An error occured while processing'

  def update
    @machine = Machine.find params[:id]
    @machine.update! machine_params
    render json: MachineSerializer.new(@machine).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :DELETE, '/machines/:id'
  param :id, :number, 'Id of the machine', required: true
  returns code: 200, desc: 'Machine has been destroyed'
  error code: 400, desc: 'An error occured while processing'

  def destroy
    @machine = Machine.find params[:id]
    @machine.destroy!
    head :ok
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  private

  def machine_params
    params.require(:machine).permit(
      :name,
      :available,
      :cellule_id,
      :machine_type_id
    )
  end
end
