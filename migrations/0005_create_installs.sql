CREATE TABLE installs (
    id              BIGSERIAL PRIMARY KEY,
    user_id         BIGINT NOT NULL REFERENCES users(id),
    app_id          BIGINT NOT NULL REFERENCES apps(id),
    version_id      BIGINT NOT NULL REFERENCES app_versions(id),
    paid_amount     NUMERIC(10, 2) NOT NULL CHECK ( paid_amount >= 0 ),
    installed_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (user_id, app_id)
);

CREATE INDEX idx_installs_app_id ON installs (app_id);