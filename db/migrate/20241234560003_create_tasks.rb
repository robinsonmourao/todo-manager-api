class CreateTasks < ActiveRecord::Migration[7.1]

  def up
    execute <<-SQL
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR(50) NOT NULL UNIQUE,
        description VARCHAR(255) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      );
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE IF EXISTS tasks;
    SQL
  end
end