class UserTask <ApplicationRecord
    validates :user_id, presence: true
    validates :task_id, presence: true, uniqueness: {scope: :user_id}

    belongs_to :user
    belongs_to :task
end