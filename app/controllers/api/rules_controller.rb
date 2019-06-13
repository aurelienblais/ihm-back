# frozen_string_literal: true

class Api::RulesController < ApplicationController
  api :GET, '/rules/', 'Return list of rules'
  returns code: 200, desc: 'List of all rules'

  def index
    render json: RuleShortSerializer.new(Rule.all).serializable_hash
  end

  api :GET, '/rules/:id', 'Return a single rule'
  param :id, :number, 'Id of the rule', required: true
  returns code: 200, desc: 'Details of a rule'

  def show
    render json: RuleSerializer.new(Rule.find(params[:id])).serializable_hash
  end

  api :POST, '/rules/', 'Create a new rule'
  param :rule_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the rule', required: true
  end
  returns code: 200, desc: 'Newly created rule'
  error code: 400, desc: 'An error occured while processing'

  def create
    @rule = Rule.create! rule_params
    render json: RuleSerializer.new(@rule).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :PATCH, '/rules/:id', 'Update a rule'
  param :rule_params, Hash, desc: 'Param description for all methods' do
    param :name, String, 'Name of the rule', required: true
  end
  returns code: 200, desc: 'Updated rule'
  error code: 400, desc: 'An error occured while processing'

  def update
    @rule = Rule.find params[:id]
    @rule.update! rule_params
    render json: RuleSerializer.new(@rule).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  api :DELETE, '/rules/:id'
  param :id, :number, 'Id of the rule', required: true
  returns code: 200, desc: 'Rule has been destroyed'
  error code: 400, desc: 'An error occured while processing'

  def destroy
    @rule = Rule.find params[:id]
    @rule.destroy!
    head :ok
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  private

  def rule_params
    params.require(:rule).permit(
      :name
    )
  end
end
