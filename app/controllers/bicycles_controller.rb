class BicyclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bicycle, only: [:show, :edit, :update, :destroy]

  def index
    @bicycles = Bicycle.search(params[:search]).paginate(page: params[:page])

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @bicycles }
      format.js { render :index }
    end
  end

  def show
  end

  def new
    @bicycle = current_user.bicycles.new
  end

  def edit
  end

  def create
    @bicycle = current_user.bicycles.new(bicycle_params)

    respond_to do |format|
      if @bicycle.save
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully created.' }
        format.json { render :show, status: :created, location: @bicycle }
      else
        format.html { render :new }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bicycle.update(bicycle_params)
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @bicycle }
      else
        format.html { render :edit }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bicycle.destroy
    respond_to do |format|
      format.html { redirect_to my_bicycles_url, notice: 'Bicycle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_bicycles
    @bicycles = current_user.bicycles.paginate(page: params[:page])
  end

  private

  def set_bicycle
    @bicycle = current_user.bicycles.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bicycle_params
    params.require(:bicycle).permit(:name, :description, :category_id)
  end
end
