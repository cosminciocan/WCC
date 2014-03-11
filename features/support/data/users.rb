module Users

  class ValidAdministrator
    def self.username
      EnvConfig['ADMIN_USERNAME']
    end

    def self.password
      EnvConfig['ADMIN_PASSWORD']
    end
  end
end