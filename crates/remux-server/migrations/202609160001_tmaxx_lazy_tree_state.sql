-- T-MAXX lazy tree hydration state.
--
-- A row means one direct-child level completed successfully.
-- The marker is deliberately separate from media rows so a
-- partially written child batch is never mistaken for a
-- completely hydrated tree level.

CREATE TABLE IF NOT EXISTS tmaxx_lazy_tree_state (
    parent_id    BLOB     NOT NULL,
    child_kind   TEXT     NOT NULL,
    hydrated_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    child_count  INTEGER  NOT NULL DEFAULT 0,

    PRIMARY KEY (parent_id, child_kind)
);

CREATE INDEX IF NOT EXISTS idx_tmaxx_lazy_tree_hydrated_at
    ON tmaxx_lazy_tree_state(hydrated_at);
