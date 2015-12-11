class User < ActiveRecord::Base
    has_secure_password

    validates :email, :name, :password, :password_confirmation, presence: true
    validates_confirmation_of :password
end
