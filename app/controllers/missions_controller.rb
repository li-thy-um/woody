class MissionsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @mission = current_user.missions.build(mission_params)
    @mission.save
    WebsocketRails[:missions].trigger 'new',
      {user: current_user.email, content: @mission.content}
    redirect_to root_path
  end

  def destroy
    @mission = Mission.find_by_id(params[:id])
    content = @mission.try(:content)
    @mission.try(:destroy)
    WebsocketRails[:missions].trigger 'destroy',
      {user: current_user.email, content: content} if content
    redirect_to root_path
  end

  private

    def mission_params
      params.require(:mission).permit(:content)
    end
end
