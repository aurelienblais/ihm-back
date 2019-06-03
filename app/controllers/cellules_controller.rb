class CellulesController < ApplicationController
  def index
    render json: CelluleSerializer.new(Cellule.all).serializable_hash
  end

  def show
    render json: CelluleSerializer.new(Cellule.find(params[:id])).serializable_hash
  end

  def create
    @cellule = Cellule.new cellule_params
    render json: CelluleSerializer.new(@cellule).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

  def update
    @cellule = Cellule.find params[:id]
    @cellule.update cellule_params
    render json: CelluleSerializer.new(@cellule).serializable_hash
  rescue Exception => e
    render json: { error: e.message }, status: 400
  end

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