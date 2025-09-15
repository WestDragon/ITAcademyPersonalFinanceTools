\c service

CREATE SCHEMA data
    AUTHORIZATION user_service_user;

CREATE TABLE data.users (
    username varchar_ignorecase (50) NOT NULL PRIMARY KEY,
    PASSWORD varchar_ignorecase (500) NOT NULL,
    enabled boolean NOT NULL
);

CREATE TABLE data.authorities (
    username varchar_ignorecase (50) NOT NULL,
    authority varchar_ignorecase (50) NOT NULL,
    CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES users (username)
);

CREATE UNIQUE INDEX ix_auth_username ON data.authorities (username, authority);

