
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE COMMENT 'Назва категорії',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Час створення'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL COMMENT 'Посилання на категорію',
    title VARCHAR(255) NOT NULL COMMENT 'Заголовок статті',
    content TEXT NOT NULL COMMENT 'Текст статті',
    author VARCHAR(255) COMMENT 'Автор статті',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Час створення',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Час оновлення',
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT NOT NULL COMMENT 'Посилання на статтю',
    author VARCHAR(255) COMMENT 'Автор коментаря',
    content TEXT NOT NULL COMMENT 'Текст коментаря',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Час створення',
    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE ratings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    article_id INT NOT NULL COMMENT 'Посилання на статтю',
    user_ip VARCHAR(45) NOT NULL COMMENT 'IP користувача',
    rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5) COMMENT 'Оцінка (1-5)',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Час створення',
    UNIQUE (article_id, user_ip),
    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
