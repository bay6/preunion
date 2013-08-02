class MissionsController < ApplicationController
  before_action :load_mission, only: [:create]
  load_and_authorize_resource

  def create
    @mission = Mission.new(mission_params)
    @mission.creator = current_user

    if @mission.save
      redirect_to @mission, notice: t('common.create_success')
    else
      render action: 'new'
    end
  end

  def update
    if @mission.update(mission_params)
      redirect_to @mission, notice: t('common.update_success')
    else
      render action: 'edit'
    end
  end

  def accept
    @mission.update_attributes(assigned_to: current_user,
                               status: 1,
                               start_time: Time.now,
                              )
    redirect_to :back, notice: t("missions.accept_success")
  end

  private

    def mission_params
      params.require(:mission).permit(:name, :description, :status)
    end

    def load_mission
      @mission = Mission.new(mission_params)
    end

end
