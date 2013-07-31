class User < ActiveRecord::Base

  class << self
    def find_or_create_from_auth_hash auth_hash
      @user = self.where(uid: auth_hash.uid, provider: :github).
        first_or_create(email: auth_hash.info.email,
                        github_homepage: auth_hash.info.urls.GitHub,
                        nickname: auth_hash.info.nickname)
    end
  end
end
