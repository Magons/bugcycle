class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bicycle
  before_action :set_suggestion, only: %i[show destroy accept]

  respond_to :html

  def show; end

  def new
    @suggestion = @bicycle.suggestions.new(
      name: @bicycle.name,
      description: @bicycle.description,
      category: @bicycle.category
    )
    respond_with @suggestion
  end

  def create
    @suggestion = @bicycle.suggestions.new(suggestion_params.merge(user: current_user))
    respond_with @suggestion
  end

  def destroy
    authorize @bicycle, :destroy?
    @suggestion.destroy
    respond_with @suggestion
  end

  def accept
    authorize @bicycle, :update?
    @bicycle.update(
      name: @suggestion.name,
      description: @suggestion.description,
      category: @suggestion.category
    )
    @suggestion.destroy
    respond_with @bicycle
  end

  private

  def set_suggestion
    @suggestion = @bicycle.suggestions.find(params[:id])
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:name, :description, :category_id)
  end
end
