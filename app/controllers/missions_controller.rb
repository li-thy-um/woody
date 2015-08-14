class MissionsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def create
    @mission = current_user.missions.build(mission_params)
    @mission.save
    render template: 'missions/index'
  end

  def destroy
    Mission.find_by_id(params[:id]).destroy
    render template: 'missions/index'
  end

  private

    def mission_params
      params.require(:mission).permit(:content)
    end
end
