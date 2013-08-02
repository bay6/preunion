class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update]
  before_action :load_mission, only: [:create]
  load_and_authorize_resource

  def index
    @missions = Mission.all
  end

  def show
  end

  def new
    @mission = Mission.new
  end

  def edit
  end

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

  private

    def set_mission
      @mission = Mission.find(params[:id])
    end

    def mission_params
      params.require(:mission).permit(:name, :description, :status)
    end

    def load_mission
      @mission = Mission.new(mission_params)
    end

end
