CREATE TABLE company(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    website VARCHAR(200),
    description TEXT
);

CREATE TABLE skill(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE job(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    employment_type ENUM('FULL_TIME', 'PART_TIME', 'CONTRACT', 'INTERN', 'FREELANCE') NOT NULL,
    experience_min INT DEFAULT 0,
    experience_max INT DEFAULT 0,
    salary_min DECIMAL(12, 2),
    salary_max DECIMAL(12, 2),
    currency VARCHAR(10) DEFAULT 'INR',
    location VARCHAR(120) NOT NULL,
    is_remote BOOLEAN DEFAULT FALSE,
    company_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_job_company FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE job_skill(
    job_id BIGINT NOT NULL,
    skill_id BIGINT NOT NULL,
    PRIMARY KEY (job_id, skill_id),
    CONSTRAINT fk_js_job FOREIGN KEY (job_id) REFERENCES job(id) ON DELETE CASCADE,
    CONSTRAINT fk_js_skill FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE
);


-- seeds
INSERT INTO company(name, website, description)
VALUES ('Acme corp', 'https://acme.example', 'Sample seeded company');

INSERT INTO skill(name) VALUES ('JAVA'), ('SPRING'), ('REACT'), ('SQL');