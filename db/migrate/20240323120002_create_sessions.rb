class CreateSessions < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
            CREATE TABLE sessions (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                user_id INTEGER NOT NULL,
                token VARCHAR(255) NOT NULL,
                expires_at TIMESTAMP NOT NULL,

                created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

                FOREIGN KEY (user_id) REFERENCES user(id)
            );
        SQL
    end

    def down
        execute <<-SQL
            DROP TABLE IF EXISTS sessions;
        SQL
    end
end