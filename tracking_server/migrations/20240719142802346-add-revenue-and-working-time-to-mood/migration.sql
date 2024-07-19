BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "mood_entry" ADD COLUMN "revenue" double precision;
ALTER TABLE "mood_entry" ADD COLUMN "workTime" bigint;

--
-- MIGRATION VERSION FOR tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tracking', '20240719142802346-add-revenue-and-working-time-to-mood', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240719142802346-add-revenue-and-working-time-to-mood', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
