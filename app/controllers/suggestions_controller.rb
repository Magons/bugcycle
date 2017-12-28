class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bicycle
  before_action :set_suggestion, only: [:show, :destroy, :accept]

  def show
  end

  def new
    @suggestion = @bicycle.suggestions.new(
      name: @bicycle.name,
      description: @bicycle.description,
      category: @bicycle.category
    )
  end

  def create
    @suggestion = @bicycle.suggestions.new(suggestion_params.merge(user: current_user))

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to bicycles_path, notice: 'Suggestion was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @bicycle, :destroy?
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to @bicycle, notice: 'Suggestion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    authorize @bicycle, :update?
    respond_to do |format|
      if @bicycle.update(
          name: @suggestion.name,
          description: @suggestion.description,
          category: @suggestion.category
        )
        @suggestion.destroy
        format.html { redirect_to @bicycle, notice: 'Bicycle was successfully updated.' }
        format.json { render :show, status: :ok, location: @bicycle }
      else
        format.html { render :edit }
        format.json { render json: @bicycle.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggestion
      @suggestion = @bicycle.suggestions.find(params[:id])
    end

    def set_bicycle
      @bicycle = Bicycle.find(params[:bicycle_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggestion_params
      params.require(:suggestion).permit(:name, :description, :category_id)
    end
end
