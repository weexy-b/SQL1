CREATE TABLE IF NOT EXISTS lines (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL, 
    color VARCHAR(7) NOT NULL  
);

CREATE TABLE IF NOT EXISTS stations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL, 
    latitude DECIMAL(9,6) NULL,
    longitude DECIMAL(9,6) NULL 
);

CREATE TABLE IF NOT EXISTS station_lines (
    station_id INT NOT NULL, 
    line_id INT NOT NULL, 
    position INT NOT NULL, -- Позиція станції на лінії (для порядкування)
    PRIMARY KEY (station_id, line_id),
    FOREIGN KEY (station_id) REFERENCES stations(id) ON DELETE CASCADE,
    FOREIGN KEY (line_id) REFERENCES lines(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS connections (
    id SERIAL PRIMARY KEY,
    station_from INT NOT NULL,
    station_to INT NOT NULL,
    distance DECIMAL(5,2) NULL, 
    is_transfer BOOLEAN NOT NULL DEFAULT FALSE, -- перевірка чи є це пересадкою
    FOREIGN KEY (station_from) REFERENCES stations(id) ON DELETE CASCADE,
    FOREIGN KEY (station_to) REFERENCES stations(id) ON DELETE CASCADE
);

INSERT INTO lines (id, name, color) VALUES
(1, 'Red Line', '#FF0000'),
(2, 'Blue Line', '#0000FF'),
(3, 'Green Line', '#00FF00')
ON CONFLICT (id) DO NOTHING;

INSERT INTO stations (id, name, latitude, longitude) VALUES
(1, 'Station A', 50.4501, 30.5234),
(2, 'Station B', 50.4521, 30.5255),
(3, 'Station C', 50.4545, 30.5277),
(4, 'Station D', 50.4567, 30.5300),
(5, 'Station E', 50.4580, 30.5322)
ON CONFLICT (id) DO NOTHING;

INSERT INTO station_lines (station_id, line_id, position) 
VALUES 
(1, 1, 1), 
(2, 1, 2), 
(3, 1, 3)
ON CONFLICT DO NOTHING;

INSERT INTO station_lines (station_id, line_id, position) 
VALUES 
(3, 3, 1), 
(4, 3, 2), 
(5, 3, 3)
ON CONFLICT DO NOTHING;

INSERT INTO connections (station_from, station_to, distance, is_transfer) 
VALUES 
(1, 2, 1.2, FALSE), 
(2, 3, 1.5, FALSE), 
(3, 4, 0.8, FALSE), 
(3, 5, 1.0, TRUE)
ON CONFLICT DO NOTHING;
