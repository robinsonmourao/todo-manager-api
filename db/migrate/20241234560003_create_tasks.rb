class CreateTasks < ActiveRecord::Migration[7.1]

  def up
    execute <<-SQL
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        title VARCHAR(50) NOT NULL,
        description VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        FOREIGN KEY (user_id) REFERENCES users(id)
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tasks;
    SQL
  end
end