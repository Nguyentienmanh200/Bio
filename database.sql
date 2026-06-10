CREATE DATABASE profile_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE profile_system;

CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admins(username,password)
VALUES(
'admin',
'$2y$10$Q9nM1kMYYyB2F2Olqv8vX.wIFcWj6qM8sAwl8x5I0n0hRgxN8b5hK'
);
/*
password mặc định:
admin123
*/

CREATE TABLE profile (
    id INT PRIMARY KEY AUTO_INCREMENT,
    avatar VARCHAR(255) DEFAULT '',
    bio LONGTEXT,

    telegram VARCHAR(255),
    facebook VARCHAR(255),
    zalo VARCHAR(255),
    tiktok VARCHAR(255),
    website VARCHAR(255),

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO profile(
avatar,
bio,
telegram,
facebook,
zalo,
tiktok,
website
)
VALUES(
'uploads/avatar.png',
'Xin chào, đây là trang cá nhân của tôi.',
'https://t.me/',
'https://facebook.com/',
'https://zalo.me/',
'https://tiktok.com/',
'https://example.com'
);

CREATE TABLE visits (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,

    ip VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),

    device VARCHAR(255),
    browser VARCHAR(255),
    os VARCHAR(255),

    visit_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_visit_time
ON visits(visit_time);

CREATE INDEX idx_ip
ON visits(ip);
