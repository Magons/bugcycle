class MarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bicycle
  before_action :set_mark, only: :destroy

  respond_to :js

  def create
    @mark = @bicycle.marks.find_by(user: current_user)
    if @mark.present?
      @mark.destroy
    else
      @bicycle.marks.create(user: current_user)
    end
    respond_with @mark
  end

  def destroy
    @mark.destroy
    respond_with @mark
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def set_mark
    @mark = @bicycle.find(user: current_user)
  end
end
