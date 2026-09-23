CREATE TABLE app_versions (
    id              BIGSERIAL PRIMARY KEY,
    app_id          BIGINT NOT NULL REFERENCES apps(id) ON DELETE CASCADE,
    version_number  INTEGER NOT NULL,
    manifest        JSONB NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(app_id, version_number)
);

ALTER TABLE apps ADD CONSTRAINT fk_apps_current_version FOREIGN KEY (current_version_id) REFERENCES app_versions(id);