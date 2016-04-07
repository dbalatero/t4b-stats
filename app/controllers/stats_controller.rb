class StatsController < ApplicationController
  def index
    @stats = CalculateStats.run

    respond_to do |format|
      format.json { render json: @stats.to_json }
      format.html { render }
    end
  end
end
