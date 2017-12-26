class MarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bicycle
  before_action :set_mark, only: :destroy

  def create
    @mark = @bicycle.marks.find_by(user: current_user)
    if @mark.present?
      @mark.destroy
    else
      @bicycle.marks.create(user: current_user)
    end
  end

  def destroy
    @mark.destroy
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def set_mark
    @mark = @bicycle.find(user: current_user)
  end
end
