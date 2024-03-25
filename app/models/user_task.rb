class UserTask <ApplicationRecord
    validates :user_id, presence: true
    validates :task_id, presence: true
end