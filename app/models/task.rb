class Task < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    
    has_one :user_tasks
end