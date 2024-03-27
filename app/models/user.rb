class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence:true, uniqueness: true
    validates :password, presence:true

    has_many :user_tasks
    has_many :tasks, through: :user_tasks, dependent: :destroy    
    has_many :sessions

    has_secure_password
end