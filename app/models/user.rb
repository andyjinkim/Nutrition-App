class User < ActiveRecord::Base
  def password=(unencrypted_password)
      #we will generate gibberish
      @password = unencrypted_password
      self.password = BCrypt::Password.create(unencrypted_password)
    end

    def authenticate(unencrypted_password)
      if BCrypt::Password.new(self.password) == unencrypted_password
        return self
      else
        false
    end
  end
  end
