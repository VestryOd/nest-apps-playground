CREATE TABLE apps (
    id              BIGSERIAL PRIMARY KEY,
    slug            TEXT UNIQUE NOT NULL,
    name            TEXT NOT NULL,
    category        TEXT,
    price           NUMERIC(10, 2) NOT NULL CHECK ( price >= 0 ),
    author_id       BIGINT NOT NULL REFERENCES users(id),
    is_published    BOOLEAN NOT NULL DEFAULT FALSE,
    current_version_id  BIGINT DEFAULT NULL
);

CREATE INDEX idx_apps_author_id ON apps (author_id);