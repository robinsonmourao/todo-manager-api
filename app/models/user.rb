class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence:true, uniqueness: true
    validates :password, presence:true

    has_many :tasks, dependent: :destroy
    has_many :sessions, dependent: :destroy

    has_secure_password
end