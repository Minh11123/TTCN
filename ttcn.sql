CREATE DATABASE if NOT EXISTS ttcn;
-- Tạo bảng category
CREATE TABLE IF NOT EXISTS ttcn.category (
    id          bigint AUTO_INCREMENT PRIMARY KEY,
    description varchar(255) NULL,
    title       varchar(255) NULL
) ENGINE = InnoDB;

-- Tạo bảng question
CREATE TABLE IF NOT EXISTS ttcn.question (
    id      bigint AUTO_INCREMENT PRIMARY KEY,
    answer  varchar(255) NULL,
    content varchar(5000) NULL,
    image   varchar(255) NULL,
    option1 varchar(255) NULL,
    option2 varchar(255) NULL,
    option3 varchar(255) NULL,
    option4 varchar(255) NULL,
    quiz_id bigint NULL,
    CONSTRAINT FK_question_quiz FOREIGN KEY (quiz_id) REFERENCES ttcn.quiz(id)
) ENGINE = InnoDB;

-- Tạo bảng quiz
CREATE TABLE IF NOT EXISTS ttcn.quiz (
    id                 bigint AUTO_INCREMENT PRIMARY KEY,
    active             bit NOT NULL,
    avatar             varchar(255) NULL,
    description        varchar(255) NULL,
    max_marks          varchar(255) NULL,
    number_of_question varchar(255) NULL,
    title              varchar(255) NULL,
    category_id        bigint NULL,
    CONSTRAINT FK_quiz_category FOREIGN KEY (category_id) REFERENCES ttcn.category(id)
) ENGINE = InnoDB;

-- Tạo bảng roles
CREATE TABLE IF NOT EXISTS ttcn.roles (
    id   bigint AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NULL
) ENGINE = InnoDB;

-- Tạo bảng test
CREATE TABLE IF NOT EXISTS ttcn.test (
    id              bigint AUTO_INCREMENT PRIMARY KEY,
    attempted       int NOT NULL,
    correct_answers int NOT NULL,
    marks_got       double NOT NULL,
    quiz_id         bigint NULL,
    user_id         bigint NULL,
    CONSTRAINT FK_test_quiz FOREIGN KEY (quiz_id) REFERENCES ttcn.quiz(id),
    CONSTRAINT FK_test_user FOREIGN KEY (user_id) REFERENCES ttcn.users(id)
) ENGINE = InnoDB;

-- Tạo bảng user_role
CREATE TABLE IF NOT EXISTS ttcn.user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, role_id),
    CONSTRAINT FK_user_role_user FOREIGN KEY (user_id) REFERENCES ttcn.users(id),
    CONSTRAINT FK_user_role_role FOREIGN KEY (role_id) REFERENCES ttcn.roles(id)
) ENGINE = InnoDB;

-- Tạo bảng users
CREATE TABLE IF NOT EXISTS ttcn.users (
    id        bigint AUTO_INCREMENT PRIMARY KEY,
    avatar    varchar(255) NULL,
    email     varchar(255) NULL,
    enable    bit NOT NULL,
    firstname varchar(255) NULL,
    lastname  varchar(255) NULL,
    password  varchar(255) NULL,
    phone     varchar(255) NULL,
    profile   varchar(255) NULL,
    username  varchar(255) NULL
) ENGINE = InnoDB;
