BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "mood_entry" (
    "id" serial PRIMARY KEY,
    "userId" text NOT NULL,
    "value" integer NOT NULL,
    "thingsIAmGratefulFor" json NOT NULL,
    "diary" text NOT NULL,
    "createdOn" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tracking', '20240304213139452-add-mood-entry', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240304213139452-add-mood-entry', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
