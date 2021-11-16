class User < ActiveRecord::Base
    has_secure_password

    validates :name, presence: true, length: { minimum: 3}
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true,confirmation: true, length: { minimum: 5}
    validates :password_confirmation, presence: true

    def self.authenticate_with_credentials(email, password)
        email = email.downcase.strip
        user = User.find_by_email(email)
        if user && user.authenticate(password)
          user
        else
          nil
        end
      end
end
