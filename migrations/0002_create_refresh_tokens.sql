CREATE TABLE refresh_tokens (
    id                      UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    token_hash              TEXT NOT NULL UNIQUE,
    user_id                 BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    expires_at              TIMESTAMPTZ NOT NULL DEFAULT now() + INTERVAL '30 days',
    replace_by_token_id     UUID REFERENCES refresh_tokens(id)
);

CREATE INDEX idx_refresh_tokens_user_id ON refresh_tokens (user_id);