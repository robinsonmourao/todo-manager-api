class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence:true, uniqueness: true
    validates :password_digest, presence:true

    has_many :tasks, dependent: :destroy
end