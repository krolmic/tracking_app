BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_key" CASCADE;


--
-- MIGRATION VERSION FOR tracking
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tracking', '20240623165558485-upgrade-to-serverpod-2', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240623165558485-upgrade-to-serverpod-2', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
