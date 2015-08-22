class MissionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @mission = current_user.missions.build(mission_params)
    @mission.save
    WebsocketRails[:time].trigger 'tick_tock', (s=Time.now.strftime('%Y-%m-%d %H:%M:%S'))

    head :no_content
    # render template: 'missions/index'
  end

  def destroy
    Mission.find_by_id(params[:id]).try(:destroy)
    render template: 'missions/index'
  end

  private

    def mission_params
      params.require(:mission).permit(:content)
    end
end
