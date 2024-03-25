class CreateUserTasks < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
            CREATE TABLE user_tasks (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                task_id INTEGER NOT NULL,

                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                
                FOREIGN KEY (user_id) REFERENCES user(id),
                FOREIGN KEY (task_id) REFERENCES task(id)
            );
        SQL
    end

    def down
        execute <<-SQL
            DROP TABLE IF EXISTS user_tasks;
        SQL
    end
end