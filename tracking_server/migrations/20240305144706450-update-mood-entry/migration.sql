BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "mood_entry" ALTER COLUMN "thingsIAmGratefulFor" DROP NOT NULL;
ALTER TABLE "mood_entry" ALTER COLUMN "diary" DROP NOT NULL;

--
-- MIGRATION VERSION FOR tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tracking', '20240305144706450-update-mood-entry', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240305144706450-update-mood-entry', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
