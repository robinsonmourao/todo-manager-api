class Task < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    
    belong_to :user
end