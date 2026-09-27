CREATE TABLE IF NOT EXISTS police_jobs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    job_name VARCHAR(50) NOT NULL,
    job_grade INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);

INSERT INTO police_jobs (player_id, job_name, job_grade) VALUES
(1, 'police', 0);