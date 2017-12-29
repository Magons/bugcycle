class BicyclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bicycle, only: %i[show edit update destroy]
  before_action :authorize_record, only: %i[edit update destroy]

  respond_to :html
  respond_to :js, only: :index

  def index
    @bicycles = Bicycle.includes(:marks, :category, :suggestions)
                       .search(params[:search], current_user)
                       .filter_by_category(params[:category_id])
                       .paginate(page: params[:page])

    respond_with @bicycles
  end

  def show; end

  def new
    respond_with @bicycle = current_user.bicycles.new
  end

  def edit; end

  def create
    respond_with @bicycle = current_user.bicycles.new(bicycle_params)
  end

  def update
    @bicycle.update(bicycle_params)
    respond_with @bicycle
  end

  def destroy
    @bicycle.destroy
    respond_with @bicycle
  end

  def my_bicycles
    @bicycles = current_user.bicycles.paginate(page: params[:page])
    respond_with @bicycles
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

  def bicycle_params
    params.require(:bicycle).permit(:name, :description, :category_id, :image)
  end

  def authorize_record
    authorize @bicycle
  end
end
