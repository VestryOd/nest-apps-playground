CREATE TABLE users (
    id            BIGSERIAL PRIMARY KEY,
    email         TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    role          TEXT NOT NULL DEFAULT 'user'
                  CHECK (role IN ('user', 'author', 'admin')),
    balance       NUMERIC(10, 2) NOT NULL DEFAULT 0
                  CHECK (balance >= 0),
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
