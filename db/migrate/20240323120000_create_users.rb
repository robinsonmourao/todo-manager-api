class CreateUsers < ActiveRecord::Migration[7.1]
    def up
        execute <<-SQL
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username VARCHAR(50) NOT NULL UNIQUE,
            email VARCHAR(255) NOT NULL UNIQUE,
            password_digest VARCHAR(12) NOT NULL,
            created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
          );
        SQL
    end

    def down
    execute <<-SQL
        DROP TABLE IF EXISTS users;
    SQL
    end
end