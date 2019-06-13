# frozen_string_literal: true

class Api::RuleStepsController < ApplicationController
  api :GET, '/rule_steps/', 'Return list of rule steps'
  returns code: 200, desc: 'List of all rule steps'

  def index
    render json: RuleStepShortSerializer.new(RuleStep.all).serializable_hash
  end

  api :GET, '/rule_steps/:id', 'Return a single rule step'
  param :id, :number, 'Id of the rule step', required: true
  returns code: 200, desc: 'Details of a rule step'

  def show
    render json: RuleStepSerializer.new(RuleStep.find(params[:id])).serializable_hash
  end

  api :POST, '/rule_steps/', 'Create a new rule step'
  param :rule_step_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the rule step', required: true
    param :order, :number, 'Order in the process', required: true
    param :rule_id, :number, 'Associated rule', required: true
    param :machine_id, :number, 'Associated machine', required: true
    param :piece_part_id, :number, 'Associated piece part', required: true
  end
  returns code: 200, desc: 'Newly created rule step'
  error code: 400, desc: 'An error occured while processing'

  def create
    @rule_step = RuleStep.create! rule_step_params
    render json: RuleStepSerializer.new(@rule_step).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :PATCH, '/rule_steps/:id', 'Update a rule step'
  param :rule_step_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the rule step', required: true
    param :order, :number, 'Order in the process', required: true
    param :rule_id, :number, 'Associated rule', required: true
    param :machine_id, :number, 'Associated machine', required: true
    param :piece_part_id, :number, 'Associated piece part', required: true
  end
  returns code: 200, desc: 'Updated rule step'
  error code: 400, desc: 'An error occured while processing'

  def update
    @rule_step = RuleStep.find params[:id]
    @rule_step.update! rule_step_params
    render json: RuleStepSerializer.new(@rule_step).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :DELETE, '/rule_steps/:id'
  param :id, :number, 'Id of the rule step', required: true
  returns code: 200, desc: 'Rule step has been destroyed'
  error code: 400, desc: 'An error occured while processing'

  def destroy
    @rule_step = RuleStep.find params[:id]
    @rule_step.destroy!
    head :ok
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  private

  def rule_step_params
    params.require(:rule_step).permit(
      :name,
      :order,
      :rule_id,
      :machine_id,
      :piece_part_id
    )
  end
end
