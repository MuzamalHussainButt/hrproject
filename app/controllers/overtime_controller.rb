class OvertimeController < ApplicationController
  def index
    @overtime = Overtime.extratime(params[:id])
  end
end
