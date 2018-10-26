CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY  NOT NULL,
  username text NOT NULL,
  uid bigint NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS users_uid_index ON users USING btree (uid);

CREATE TABLE IF NOT EXISTS entries (
  id SERIAL PRIMARY KEY NOT NULL,
  length integer NOT NULL,
  created_at timestamp without time zone NULL,
  user_id integer REFERENCES users(id) NOT NULL
);

CREATE INDEX IF NOT EXISTS entries_user_id_index ON entries USING btree (user_id);
