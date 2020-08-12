CREATE DATABASE yeticave DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;
USE yeticave;

CREATE TABLE category (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  symbol_code VARCHAR(255)
);

CREATE TABLE bet (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  date_rate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  sum INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED,
  lot_id INT UNSIGNED,

  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (lot_id) REFERENCES lots(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  date_registration TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(128) NOT NULL UNIQUE,
  name VARCHAR(255),
  password VARCHAR(255),
  contact VARCHAR(255),
  lot_id INT UNSIGNED,
  bet_id INT UNSIGNED,

  FOREIGN KEY (bet_id) REFERENCES bet(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (lot_id) REFERENCES lots(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE lots (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  name VARCHAR(255),
  title VARCHAR(255),
  url_img VARCHAR(255),
  start_cost INT,
  date_end TIMESTAMP,
  step_bet INT UNSIGNED,
  user_id INT UNSIGNED,
  winner_id INT UNSIGNED,
  category_id INT UNSIGNED,

  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (winner_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category(id) ON UPDATE CASCADE ON DELETE CASCADE
);
