class TeamsController < ApplicationController
  load_and_authorize_resource

  def create
    if @team.save
      redirect_to @team, notice: t('common.create_success')
    else
      render action: :new
    end
  end

  def update
    if @team.update_attributes(team_params)
      redirect_to @team, notice: t('common.update_success')
    else
      render action: :edit
    end
  end

  def join
    @team.users << current_user
    if @team.save
      redirect_to team_path(@team), notice: t('teams.join_success')
    else
      redirect_to team_path(@team), notice: t('teams.join_fail')
    end
  end

  def quit
    @team.users.delete(current_user)
    redirect_to team_path(@team), notice: t('teams.quit_success')
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: t('common.destroy_success')
  end

  private
  def team_params
    params.require(:team).permit(:name, :description, :avatar_url)
  end
end
