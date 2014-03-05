class User < ActiveRecord::Base
    has_secure_password

   # attr_accessible :email, :password, :password_confirmation

    validates_uniqueness_of :email

    #Do not need to validate the password or password confirmation
end
