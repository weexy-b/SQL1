INSERT INTO tasks (project_id, author_id, title, description)
SELECT 1, 1, 'New Task Title', 'Description of the new task'
FROM project_users
WHERE project_id = 1 AND user_id = 1
LIMIT 1;

INSERT OR IGNORE INTO task_executors (task_id, user_id)
SELECT 1, 2
FROM project_users
WHERE project_id = 1 AND user_id = 2
LIMIT 1;

INSERT INTO files (project_id, file_url)
VALUES (1, 'https://example.com/project_file');

INSERT INTO files (task_id, file_url)
VALUES (1, 'https://example.com/task_file');

SELECT t.id AS task_id, t.title AS task_title, u.name AS author_name
FROM tasks t
JOIN users u ON t.author_id = u.id
WHERE t.project_id = 1;

SELECT u.name AS executor_name
FROM task_executors te
JOIN users u ON te.user_id = u.id
WHERE te.task_id = 1;

SELECT f.file_url, 
       CASE 
           WHEN f.task_id IS NULL THEN 'Project'
           ELSE 'Task ID: ' || f.task_id
       END AS context
FROM files f
WHERE f.project_id = 1;

DELETE FROM task_executors
WHERE task_id = 1 AND user_id = 2;

-- Для задачі
DELETE FROM files
WHERE task_id = 1 AND file_url = 'https://example.com/task_file';

-- Для проєкту
DELETE FROM files
WHERE project_id = 1 AND file_url = 'https://example.com/project_file';
