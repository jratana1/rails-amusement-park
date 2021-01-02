class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        if self.happiness >= self.nausea
            "happy"
        else
            "sad"
        end
    end

    def self.current_user(session)
        current_user ||= User.find_by_id(session[:user_id])
    end
end
