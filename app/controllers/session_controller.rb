class SessionController < ApplicationController

  def auth
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to root_path, notice: t('auth_success')
  end

  def destroy
    self.current_user = nil
    redirect_to root_path
  end

  private
  def auth_hash
    request.env['omniauth.auth'].except('extra')
  end
end
