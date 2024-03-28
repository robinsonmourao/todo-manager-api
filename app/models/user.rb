class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence:true, uniqueness: true
    validates :password, presence:true

    has_many :tasks
    has_many :sessions

    has_secure_password
end